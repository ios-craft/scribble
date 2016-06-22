//
// Created by Tomek Cejner on 29/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SceneMediator;


@interface MediatorFactory : NSObject


+ (id)sharedMediatorFactory;

- (SceneMediator *)injectSceneMediator;
@end