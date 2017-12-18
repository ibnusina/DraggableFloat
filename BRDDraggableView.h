//
//  BRDDraggableView.h
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/15/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRDDraggableView : UIView

@property (nonatomic, copy, nullable) void (^tapHandler) (UIView *_Nonnull);

@end
