//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "NotificationPublisher.h"



@implementation NotificationPublisher {

}



+ (void)postCanvasRefreshRequest {
    
    NSNotification *notification = [NSNotification notificationWithName:kRefreshNotificationName object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];

}
@end