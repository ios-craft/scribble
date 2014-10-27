//
// Created by Tomek Cejner on 27/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"


@interface Vertex : NSObject <Mark>

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

- (instancetype)initWithLocation:(CGPoint)location;

+ (instancetype)vertexWithLocation:(CGPoint)location;


@end