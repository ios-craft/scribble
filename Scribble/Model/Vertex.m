//
// Created by Tomek Cejner on 27/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "Vertex.h"


@implementation Vertex {

}
- (instancetype)initWithLocation:(CGPoint)location {
    self = [super init];
    if (self) {
        self.location = location;
    }
    return self;
}

+ (instancetype)vertexWithLocation:(CGPoint)location {
    return [[self alloc] initWithLocation:location];
}

- (void)addMark:(id <Mark>)mark {

}

- (void)removeMark:(id <Mark>)mark {

}

- (id <Mark>)childMarkAtIndex:(NSUInteger)index {
    return nil;
}

- (NSUInteger)count {
    return 0;
}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;

    CGContextAddLineToPoint(context, x, y);
}


@end