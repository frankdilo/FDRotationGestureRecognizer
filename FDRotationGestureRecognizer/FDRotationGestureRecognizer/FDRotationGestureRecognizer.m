//
//  FDRotationGestureRecognizer.m
//
//  Created by Francesco Di Lorenzo on 18/02/14.
//  Copyright (c) 2014 Francesco Di Lorenzo. All rights reserved.
//

#import "FDRotationGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface FDRotationGestureRecognizer ()

@property (nonatomic) CGFloat currentRotation;
@property(nonatomic) CGPoint startingPoint;
@property(nonatomic) CGPoint endPoint;
@property(nonatomic) CGPoint center;
@property(nonatomic) CGFloat previousRotation;

@end

@implementation FDRotationGestureRecognizer

- (id) initWithCenter:(CGPoint)center
{
    self = [super init];
    if (self) {
        self.center = center;
        self.currentRotation = 0;
        self.previousRotation = 0;
        self.startingPoint = CGPointZero;
        self.endPoint = CGPointZero;
    }
    return self;
}

- (CGFloat)rotation {
    return self.currentRotation + self.previousRotation;
}

- (void)resetRotation {
    self.currentRotation = 0;
    self.previousRotation = 0;
}


// Mirror of the touch-delivery methods on UIResponder
// UIGestureRecognizers aren't in the responder chain, but observe touches hit-tested to their view and their view's subviews
// UIGestureRecognizers receive touches before the view to which the touch was hit-tested
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    self.startingPoint = [[touches anyObject] locationInView:self.view];
    self.state = UIGestureRecognizerStateBegan;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];

    CGPoint point = [[touches anyObject] locationInView:self.view];
    self.currentRotation = [self angleBetweenPoint:self.startingPoint andPoint:point];
    self.state = UIGestureRecognizerStateChanged;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    self.endPoint = [[touches anyObject] locationInView:self.view];
    self.currentRotation = [self angleBetweenPoint:self.startingPoint andPoint:self.endPoint];
    self.state = UIGestureRecognizerStateEnded;
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateCancelled;
}

/**
* Called automatically by the runtime after the gesture state has been set to UIGestureRecognizerStateEnded
* any internal state should be reset to prepare for a new attempt to recognize the gesture after this is received all
* remaining active touches will be ignored (no further updates will be received for touches that had already begun but
* haven't ended)
*/
- (void)reset
{
    [super reset];
    _previousRotation = [self rotation];
    _currentRotation = 0;
}

#define rad_to_degree(x) (180*x)/M_PI

- (CGFloat)angleBetweenPoint:(CGPoint)first andPoint:(CGPoint)second {
    CGPoint centeredPoint1 = CGPointMake(first.x - _center.x, first.y - _center.y);
    CGPoint centeredPoint2 = CGPointMake(second.x - _center.x, second.y - _center.y);
    
    CGFloat firstAngle = angleBetweenOriginAndPoint(centeredPoint1);
    CGFloat secondAngle = angleBetweenOriginAndPoint(centeredPoint2);
    
    CGFloat rads = secondAngle - firstAngle;
    
    return rads;
}

CGFloat angleBetweenOriginAndPoint(CGPoint p) {
    if (p.x  == 0) {
        return sign(p.y) * M_PI;
    }


    CGFloat angle = atan(-p.y / p.x); // '-' because negative ordinates are positive in UIKit

    // atan() is defined in [-pi/2, pi/2], but we want a value in [0, 2*pi]
    // so we deal with these special cases accordingly
    switch (quadrantForPoint(p)) {
        case 1:
        case 2: angle += M_PI; break;
        case 3: angle += 2* M_PI; break;
    }
    
    return angle;
}

/**
* Return the quadrants the given points belong to
*/
NSInteger quadrantForPoint(CGPoint p) {
    if (p.x > 0 && p.y < 0) {
        return 0;
    } else if (p.x < 0 && p.y < 0) {
        return 1;
    } else if (p.x < 0 && p.y > 0) {
        return 2;
    } else if (p.x > 0 && p.y > 0)  {
        return 3;
    }

    return 0;
}

NSInteger sign(CGFloat num) {
    if (num == 0) {
        return 0;
    } else if (num > 0) {
        return 1;
    } else {
        return -1;
    }
}

- (NSString *)description {
    NSMutableString *desc = [NSMutableString string];
    [desc appendFormat:@"\nangle: %f\n", self.currentRotation *180 / M_PI];
    return desc;
}

@end
