//
//  ScribbleView.h
//  Scribble
//
//  Created by Tomek Cejner on 26/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mark;

@interface ScribbleView : UIView

@property (nonatomic, strong) id <Mark> mark;

@end
