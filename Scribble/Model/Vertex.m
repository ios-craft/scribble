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

#pragma mark -
#pragma mark NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        self.location = [(NSValue *)[coder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:[NSValue valueWithCGPoint:self.location] forKey:@"VertexLocation"];
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

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"%.0f,%.0f", self.location.x, self.location.y];
    [description appendString:@">"];
    return description;
}


@end