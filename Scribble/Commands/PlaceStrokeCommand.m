//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "PlaceStrokeCommand.h"
#import "Scribble.h"
#import "Stroke.h"
#import "Vertex.h"
#import "NotificationPublisher.h"


@implementation PlaceStrokeCommand {

}


- (void)execute {

    Stroke* stroke = [Stroke new];
    for (Vertex *v in self.vertices) {
        [stroke addMark:v];
    }
    [self.receiver addNewMark:stroke];
    [NotificationPublisher postCanvasRefreshRequest];

}

@end