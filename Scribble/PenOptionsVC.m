//
//  PenOptionsVC.m
//  Scribble
//
//  Created by Tomek Cejner on 29/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "PenOptionsVC.h"
#import "MediatorFactory.h"
#import "SceneMediator.h"

@interface PenOptionsVC ()

@end

@implementation PenOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sceneMediator = [[MediatorFactory sharedMediatorFactory] injectSceneMediator];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)sliderChanged:(UISlider *)sender {
    [self setPenSize:sender.value];
}

- (void)setPenSize:(float)value {
    self.penSizeLabel.text = [NSString stringWithFormat:@"%.0f", value];
}


@end
