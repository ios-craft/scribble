//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString *const kRefreshNotificationName = @"REFRESH";

@interface NotificationPublisher : NSObject

+ (void)postCanvasRefreshRequest;

@end