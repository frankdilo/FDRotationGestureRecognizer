//
//  FDRotationGestureRecognizer.h
//
//  Created by Francesco Di Lorenzo on 18/02/14.
//

#import <UIKit/UIKit.h>

@interface FDRotationGestureRecognizer : UIGestureRecognizer

/**
* Instantiate a gesture recognizer with the given center. When the interaction starts and the user starts dragging
* on the view, the rotation is calculated relatively to the center.
*/
- (instancetype)initWithCenter:(CGPoint)center;

/**
* The current rotation.
 */
- (CGFloat)rotation;


/**
* Reset the rotation back to zero.
*/
- (void)resetRotation;

@end
