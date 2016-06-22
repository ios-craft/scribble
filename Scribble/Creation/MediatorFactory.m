//
// Created by Tomek Cejner on 29/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "MediatorFactory.h"
#import "SceneMediator.h"


@implementation MediatorFactory {

    SceneMediator *_sceneMediator;

}


+ (id)sharedMediatorFactory {
    static MediatorFactory *sharedMediatorFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMediatorFactory = [[self alloc] init];
    });
    return sharedMediatorFactory;
}

- (SceneMediator *)injectSceneMediator {
    if (!_sceneMediator) {
        _sceneMediator = [[SceneMediator alloc] init];
    }
    return _sceneMediator;
}


@end