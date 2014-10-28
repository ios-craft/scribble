//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScribbleView;


@interface CanvasNotificationsMediator : NSObject
- (instancetype)initWithView:(ScribbleView *)aView;

+ (instancetype)mediatorWithView:(ScribbleView *)aView;


@end