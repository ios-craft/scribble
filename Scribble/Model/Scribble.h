//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark;
@class ScribbleMemento;


@interface Scribble : NSObject


- (id <Mark>)rootMark;

- (id)initWithMemento:(ScribbleMemento *)memento;

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)memento;

- (void)startFromScratch;

- (void)addNewMark:(id <Mark>)aMark;

- (void)appendToCurrentMark:(id <Mark>)mark;

- (ScribbleMemento *)scribbleMemento;
@end