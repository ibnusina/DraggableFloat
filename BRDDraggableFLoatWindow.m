//
//  BRDDraggableFLoatWindow.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableFLoatWindow.h"

@interface BRDDraggableFLoatWindow()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation BRDDraggableFLoatWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelNormal;
    }
    return self;
}

- (void)addView:(UIView *)view
{
    [self addSubview:view];
}

- (void)removeView:(UIView *)view
{
    [view removeFromSuperview];
}

- (void)removeAllViews
{
    for (UIView *view in self.subviews) {
        [self removeView:view];
    }
}

#pragma mark - overrided function

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden) {
        return NO;
    }
    for (UIView *view in self.subviews) {
        CGRect rect = [self convertRect:view.frame fromWindow:self];
        BOOL contained = CGRectContainsPoint(rect, point);
        if (contained) {
            return YES;
        }
    }
    return NO;
}



@end
