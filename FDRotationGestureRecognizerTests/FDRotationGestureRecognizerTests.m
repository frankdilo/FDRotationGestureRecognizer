//
//  FDRotationGestureRecognizerTests.m
//  FDRotationGestureRecognizerTests
//
//  Created by Francesco Di Lorenzo on 21/06/15.
//  Copyright (c) 2015 Francesco Di Lorenzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FDRotationGestureRecognizer.h"

@interface FDRotationGestureRecognizer (Testing)

- (CGFloat)angleBetweenPoint:(CGPoint)first andPoint:(CGPoint)second;

@end

@interface FDRotationGestureRecognizerTests : XCTestCase

@property FDRotationGestureRecognizer *gr;

@end

@implementation FDRotationGestureRecognizerTests

#define DEGREE_TO_RAD(x) (x * M_PI)/180

- (void)setUp {
    [super setUp];

    _gr = [[FDRotationGestureRecognizer alloc] initWithCenter:CGPointZero];
}

- (void)test0DegreeAngle {
    [self testAngle:0];
}

- (void)test30DegreeAngle {
    [self testAngle:30];
}

- (void)test90DegreeAngle {
    [self testAngle:90];
}

- (void)test120DegreeAngle {
    [self testAngle:120];
}

- (void)test180DegreeAngle {
    [self testAngle:180];
}

- (void)test225DegreeAngle {
    [self testAngle:225];
}

- (void)test270DegreeAngle {
    [self testAngle:270];
}

- (void)test315DegreeAngle {
    [self testAngle:315];
}

- (void)testAngle:(double)angle {
    CGPoint point1 = CGPointMake(1, 0);
    CGPoint point2 = CGPointMake(cos(DEGREE_TO_RAD(angle)), -sin(DEGREE_TO_RAD(angle)));
    CGFloat angleBetweenPoints = [self.gr angleBetweenPoint:point1 andPoint:point2];
    XCTAssertEqualWithAccuracy(angleBetweenPoints, DEGREE_TO_RAD(angle), 0.0001);
}


@end
