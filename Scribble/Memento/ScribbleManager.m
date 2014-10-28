//
// Created by Tomek Cejner on 28/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"
#import "ScribbleMemento.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]

@implementation ScribbleManager {

}

- (void)saveScribble:(Scribble *)scribble {

    NSString *scribbleDataName = @"scribble";

    // get a memento from the scribble
    // then save the memento in the file system
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath]
            stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];


}

- (Scribble *)restoreScribble {
    return nil;
}


#pragma mark -
#pragma mark Private Methods

- (NSString *) scribbleDataPath
{
    // lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }

    return kScribbleDataPath;
}

@end