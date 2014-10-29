//
//  ViewController.m
//  Scribble
//
//  Created by Tomek Cejner on 26/10/14.
//  Copyright (c) 2014 Tomek Cejner. All rights reserved.
//

#import "ViewController.h"
#import "Scribble.h"
#import "ScribbleView.h"
#import "Vertex.h"
#import "Stroke.h"
#import "Dot.h"
#import "ScribbleMemento.h"
#import "ScribbleManager.h"
#import "PlaceDotCommand.h"
#import "CanvasNotificationsMediator.h"
#import "PlaceStrokeCommand.h"


@interface ViewController () {
    Scribble *scribble;
    IBOutlet ScribbleView *canvas;
    CanvasNotificationsMediator *mediator;
}

@end

@implementation ViewController {
    CGPoint startPoint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Scribble";

    [self setEmptyScribble];
    mediator = [[CanvasNotificationsMediator alloc] initWithView:canvas];

}

- (void)setEmptyScribble {
    scribble = [Scribble new];
    canvas.mark = scribble.rootMark;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    startPoint = [[touches anyObject] locationInView:canvas];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvas];

    if (CGPointEqualToPoint(lastPoint, startPoint)) {
        id <Mark> newStroke = [Stroke new];
        [scribble addNewMark:newStroke];
    }

    CGPoint thisPoint = [[touches anyObject] locationInView:canvas];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [scribble appendToCurrentMark:vertex];

    [canvas setNeedsDisplay];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvas];
    CGPoint thisPoint = [[touches anyObject] locationInView:canvas];

    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        [self drawDotAt:thisPoint];
    } else {
        [self drawStroke];
    }

    startPoint = CGPointZero;

}

- (void)drawStroke {
    PlaceStrokeCommand *cmd = [PlaceStrokeCommand new];
    cmd.receiver = scribble;
    cmd.location = startPoint;
    cmd.vertices = [scribble verticesOfCurrentStroke];
    NSLog(@"Vertices %@", cmd.vertices);
    [cmd execute];
}

- (void)drawDotAt:(CGPoint)thisPoint {
    PlaceDotCommand *cmd = [PlaceDotCommand new];
    cmd.receiver = scribble;
    cmd.location = thisPoint;

    [cmd execute];

//    Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
//    [scribble addNewMark:singleDot];
//    [canvas setNeedsDisplay];
}

- (IBAction)newTapped:(id)sender {
    [self setEmptyScribble];
    [canvas setNeedsDisplay];
}

- (IBAction)saveTapped:(id)sender {
    ScribbleManager *manager = [ScribbleManager new];
    [manager saveScribble:scribble];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Your scribble is saved"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)loadTapped:(id)sender {
    ScribbleManager *manager = [ScribbleManager new];
    scribble = [manager restoreScribble];
    canvas.mark = scribble.rootMark;
    [canvas setNeedsDisplay];
}


@end
