//
//  PenOptionsVC.h
//  Scribble
//
//  Created by Tomek Cejner on 29/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SceneMediator;

@interface PenOptionsVC : UIViewController
- (IBAction)sliderChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *penSizeSlider;
@property (strong, nonatomic) IBOutlet UILabel *penSizeLabel;
@property(nonatomic, strong) SceneMediator *sceneMediator;
@end
