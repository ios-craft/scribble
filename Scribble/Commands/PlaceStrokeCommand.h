//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import <UIKit/UIKit.h>

@class Scribble;


@interface PlaceStrokeCommand : NSObject <Command>

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, strong) Scribble *receiver;
@property (nonatomic, strong) NSArray *vertices;

@end