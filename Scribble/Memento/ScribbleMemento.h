//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark;


@interface ScribbleMemento : NSObject
- (instancetype)initWithMark:(id <Mark>)aMark;

- (NSData *)data;

+ (ScribbleMemento *)mementoWithData:(NSData *)data;

+ (instancetype)mementoWithMark:(id <Mark>)aMark;

@end