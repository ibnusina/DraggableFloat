//
//  BRDDraggableFloat.h
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableFLoatWindow.h"
#import "BRDDraggableView.h"


@interface BRDDraggableFloat : NSObject

@property (nonatomic, strong) BRDDraggableFLoatWindow *window;

- (void)show:(BOOL)show;
- (void)addView:(UIView *)view;
- (void)removeView:(UIView *)view;
- (void)removeAllViews;

@end
