//
// Created by Tomek Cejner on 29/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ViewController;
@class PenOptionsVC;


@interface SceneMediator : NSObject

@property (nonatomic, strong) IBOutlet ViewController *mainViewController;
@property (nonatomic, strong) IBOutlet PenOptionsVC *penOptionsVC;

- (void)willDisplayPenOptions:(UIStoryboardSegue *)segue currentSize:(double)size;
@end