//
// Created by Tomek Cejner on 27/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol Mark <NSObject>

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

// Drawing
- (void) drawWithContext:(CGContextRef)context;


@end