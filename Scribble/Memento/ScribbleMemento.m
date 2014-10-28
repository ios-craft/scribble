//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"



@implementation ScribbleMemento {
    id <Mark> mark;
}

@synthesize mark = mark;

- (instancetype)initWithMark:(id <Mark>)aMark {
    self = [super init];
    if (self) {
        mark = aMark;
    }

    return self;
}

+ (instancetype)mementoWithMark:(id <Mark>)aMark {
    return [[self alloc] initWithMark:aMark];
}

- (NSData *)data {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mark];
    NSLog(@"Archived to %@", data);
    return data;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data {
    // It raises an NSInvalidArchiveOperationException if data is not a valid archive
    id <Mark> restoredMark = (id <Mark>) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:restoredMark];
    return memento;
}

@end