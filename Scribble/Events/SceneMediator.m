//
// Created by Tomek Cejner on 29/10/14.
// Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "SceneMediator.h"
#import "ViewController.h"
#import "PenOptionsVC.h"


@implementation SceneMediator {

}
- (void)willDisplayPenOptions:(UIStoryboardSegue *)segue currentSize:(double)size {

    PenOptionsVC *vc = segue.destinationViewController;
    vc.navigationItem.title = @"Pen Options";

}
@end