//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Scribble;


@interface ScribbleManager : NSObject
{

}


- (void)saveScribble:(Scribble *)scribble;

- (Scribble *)restoreScribble;
@end