//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "PlaceDotCommand.h"
#import "Scribble.h"
#import "Dot.h"
#import "NotificationPublisher.h"


@implementation PlaceDotCommand {

}

- (void)execute {
    Dot *dot = [[Dot alloc] initWithLocation:self.location];
    [self.receiver addNewMark:dot];
    [NotificationPublisher postCanvasRefreshRequest];
}

@end