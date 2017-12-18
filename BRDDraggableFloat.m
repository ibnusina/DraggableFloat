//
//  BRDDraggableFloat.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableFloat.h"

@implementation BRDDraggableFloat

- (BRDDraggableFLoatWindow *)window
{
    if (!_window) {
        _window = [[BRDDraggableFLoatWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}

- (void)show:(BOOL)show
{
    self.window.hidden = !show;
}

- (void)addView:(UIView *)view
{
    [self.window addView:view];
}

- (void)removeView:(UIView *)view
{
    [self.window removeView:view];
}

- (void)removeAllViews
{
    [self.window removeAllViews];
}

@end
