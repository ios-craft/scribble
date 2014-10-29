//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "Scribble.h"
#import "Mark.h"
#import "Stroke.h"
#import "ScribbleMemento.h"


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

- (id)initWithMemento:(ScribbleMemento *)memento {
    self = [super init];
    if (self) {
        //[self startFromScratch];
        [self startFromScratch];
        [rootMark addMark:memento.mark];
    }

    return self;
}

+ (instancetype)scribbleWithMemento:(ScribbleMemento *)memento {
    return [[Scribble alloc] initWithMemento:memento];
}

- (void)addNewMark:(id <Mark>)aMark {
    [rootMark addMark:aMark];
    workingMark = aMark;
}

- (void)appendToCurrentMark:(id <Mark>)mark {
    [workingMark addMark:mark];
}


- (ScribbleMemento *)scribbleMemento {
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:self.rootMark];
    return memento;
}

- (NSArray *)verticesOfCurrentStroke {
    Stroke *stroke = workingMark;
    return [stroke allVertices];
}
@end