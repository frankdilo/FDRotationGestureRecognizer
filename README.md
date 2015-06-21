# FDRotationGestureRecognizer

A `UIGestureRecognizer` subclass that, once added to a view, allows to easily measure the rotation performed by the user dragging on the screen.

## Demo

This is just a little demo built around the gesture recognizer:
![](https://github.com/frankdilo/FDRotationGestureRecognizer/raw/master/Other/demo.gif)
(video available [here](https://github.com/frankdilo/FDRotationGestureRecognizer/raw/master/Other/demo.mov) if you don't like gifs)

## How it works

Basically when the user starts the gesture, the initial tap coordinates are recorded and, as the gesture continues, the angle is updated as explained in this image.

![](https://github.com/frankdilo/FDRotationGestureRecognizer/raw/master/Other/explanation.png)
