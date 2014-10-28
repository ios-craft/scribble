//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "Scribble.h"
#import "Mark.h"
#import "Stroke.h"


@implementation Scribble {
    id <Mark> rootMark;
    id <Mark> workingMark;
}

- (id <Mark>)rootMark {
    return rootMark;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self startFromScratch];
    }

    return self;
}

- (void)startFromScratch {
    rootMark = [Stroke new];
    workingMark = nil;
}

- (void)addNewMark:(id <Mark>)aMark {
    [rootMark addMark:aMark];
    workingMark = aMark;
}

- (void)appendToCurrentMark:(id <Mark>)mark {
    [workingMark addMark:mark];
}


@end