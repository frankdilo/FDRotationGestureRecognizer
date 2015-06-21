//
//  ViewController.m
//  FDRotationGestureRecognizer
//
//  Created by Francesco Di Lorenzo on 21/06/15.
//  Copyright (c) 2015 Francesco Di Lorenzo. All rights reserved.
//

#import "ViewController.h"
#import "FDRotationGestureRecognizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.redSquare = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-50, 100, 100)];
    self.redSquare.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.redSquare];

    FDRotationGestureRecognizer *gr = [[FDRotationGestureRecognizer alloc] initWithCenter:self.view.center];
    [gr addTarget:self action:@selector(rotationPerformed:)];
    [self.view addGestureRecognizer:gr];
}

- (void)rotationPerformed:(FDRotationGestureRecognizer *)gestureRec {
    self.redSquare.transform = CGAffineTransformMakeRotation(-[gestureRec rotation]);
}


@end
