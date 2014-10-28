//
// Created by Tomek Cejner on 27/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "Stroke.h"

static const CGFloat lineWidth = 8.0f;

@implementation Stroke {
@private
    NSMutableArray *children;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        children = [NSMutableArray arrayWithCapacity:10];
    }

    return self;
}

- (CGPoint)location {
    // return the location of the first child
    if ([children count] > 0) {
        id <Mark> mark = children[0];
        return mark.location;
    }

    // otherwise returns the origin
    return CGPointZero;
}

- (void)addMark:(id <Mark>)mark {
    [children addObject:mark];
}

- (id <Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index >= [children count]) return nil;
    return [children objectAtIndex:index];
}

// returns number of children
- (NSUInteger)count {
    return [children count];
}

- (void)drawWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, self.location.x, self.location.y);

    for (id <Mark> mark in children) {
        [mark drawWithContext:context];
    }

    CGContextSetLineWidth(context, lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextStrokePath(context);
}


@end