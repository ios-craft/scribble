//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Command.h"

@class Scribble;


@interface PlaceDotCommand : NSObject <Command>

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, strong) Scribble *receiver;


@end