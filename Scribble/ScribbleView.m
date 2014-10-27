//
//  ScribbleView.m
//  Scribble
//
//  Created by Tomek Cejner on 26/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "ScribbleView.h"
#import "Mark.h"

@implementation ScribbleView
{
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.mark drawWithContext:context];
}


@end
