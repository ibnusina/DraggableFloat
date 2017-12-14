//
//  BRDDraggableFLoatWindow.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableFLoatWindow.h"

@interface BRDDraggableFLoatWindow()

@property (nonatomic, strong) UIViewController *overlayViewController;

@end

@implementation BRDDraggableFLoatWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelNormal;
        self.rootViewController = self.overlayViewController;
    }
    return self;
}

- (UIViewController *)overlayViewController
{
    if (!_overlayViewController) {
        _overlayViewController = [[UIViewController alloc] init];
    }
    return _overlayViewController;
}



@end
