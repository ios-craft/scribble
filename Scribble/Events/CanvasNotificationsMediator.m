//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "CanvasNotificationsMediator.h"
#import "ScribbleView.h"
#import "NotificationPublisher.h"

@implementation CanvasNotificationsMediator {

    ScribbleView *view;

}


- (instancetype)initWithView:(ScribbleView *)aView {
    self = [super init];
    if (self) {
        view = aView;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleRepaintRequest:)
                                                     name:kRefreshNotificationName object:nil];
    }

    return self;
}

- (void)handleRepaintRequest:(id)handleRepaintRequest {
    NSLog(@"Repaint requested");
    [view setNeedsDisplay];
}

+ (instancetype)mediatorWithView:(ScribbleView *)aView {
    return [[self alloc] initWithView:aView];
}


@end