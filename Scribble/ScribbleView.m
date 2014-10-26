//
//  ScribbleView.m
//  Scribble
//
//  Created by Tomek Cejner on 26/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "ScribbleView.h"

static float dotSize = 16.0;

@implementation ScribbleView
{
    NSMutableArray *allStrokes;
    NSMutableArray *currentStroke;

}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeScribble];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeScribble];
    }
    return self;
}

- (void)initializeScribble {
    NSLog(@"Initializing View");
    allStrokes = [NSMutableArray arrayWithCapacity:500];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    for (NSMutableArray *stroke in allStrokes) {
        if (stroke.count == 1) {
            CGPoint p = [stroke[0] CGPointValue];
            [self drawDotAtPoint:p inContext:context];
        } else {
            NSEnumerator *enumerator = [stroke objectEnumerator];
            NSValue *head = [enumerator nextObject];
            CGPoint headPoint = [head CGPointValue];
            CGContextMoveToPoint(context, headPoint.x, headPoint.y);

            NSValue *node;
            while (node = [enumerator nextObject]) {
                CGPoint point = [node CGPointValue];
                CGContextAddLineToPoint(context, point.x, point.y);
            }

            CGContextSetLineWidth(context, dotSize);
            CGContextSetLineCap(context, kCGLineCapRound);
            CGContextStrokePath(context);
        }
    }
}


- (void)addPathPointAt:(CGPoint)point {
    [currentStroke addObject:[NSValue valueWithCGPoint:point]];
}

- (void)drawDotAtPoint:(CGPoint)loc inContext:(CGContextRef)context {
    CGRect frame = CGRectMake(loc.x - dotSize / 2.0f, loc.y - dotSize / 2.0f, dotSize, dotSize);

    CGContextSetFillColorWithColor (context,[[UIColor blackColor] CGColor]);
    CGContextFillEllipseInRect(context, frame);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint loc = [[touches anyObject] locationInView:self];
    NSLog(@"TOUCH %.0f %.0f", loc.x, loc.y);
    currentStroke = [NSMutableArray array];
    [self finalizePath];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint loc = [[touches anyObject] locationInView:self];
    NSLog(@"END   %.0f %.0f", loc.x, loc.y);
    [self addPathPointAt:loc];
    [self setNeedsDisplay];
}

- (void)finalizePath {
    [allStrokes addObject:currentStroke];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint loc = [[touches anyObject] locationInView:self];
    NSLog(@"MOVE  %.0f %.0f", loc.x, loc.y);

    [self addPathPointAt:loc];
    [self setNeedsDisplay];
}



@end
