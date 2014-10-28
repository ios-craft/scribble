//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "Dot.h"

static CGFloat dotSize = 8.0;


@implementation Dot {

}

- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = dotSize;
    CGRect frame = CGRectMake(x - frameSize / 2.0f,
            y - frameSize / 2.0f,
            frameSize,
            frameSize);

    CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextFillEllipseInRect(context, frame);
}

@end