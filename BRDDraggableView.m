//
//  BRDDraggableView.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/15/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableView.h"

typedef enum : NSUInteger {
    BRDDraggableViewMoveDirectionLeft,
    BRDDraggableViewMoveDirectionTop,
    BRDDraggableViewMoveDirectionRight,
    BRDDraggableViewMoveDirectionBottom
} BRDDraggableViewMoveDirection;

@implementation BRDDraggableView

- (instancetype)init
{
    self = [self initWithFrame:CGRectZero];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUserInteraction];
    }
    return self;
}

- (void)setupUserInteraction
{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handlePan:)];
    [self addGestureRecognizer:pgr];
    
    UITapGestureRecognizer* tgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handleTap:)];
    [self addGestureRecognizer:tgr];
}

-(void)handlePan:(UIPanGestureRecognizer*)pgr;
{
    if (pgr.state == UIGestureRecognizerStateChanged) {
        CGPoint center = pgr.view.center;
        CGPoint translation = [pgr translationInView:pgr.view];
        center = CGPointMake(center.x + translation.x,
                             center.y + translation.y);
        pgr.view.center = center;
        [pgr setTranslation:CGPointZero inView:pgr.view];
    } else if (pgr.state == UIGestureRecognizerStateEnded) {
        [self moveAside];
    }
}

-(void)handleTap:(UIPanGestureRecognizer*)tgr
{
    if (self.tapHandler) {
        self.tapHandler(tgr.view);
    }
}

#pragma mark - move after finger lifted

- (void)moveAside
{
    CGRect parentBound = [UIScreen mainScreen].bounds;
    BRDDraggableViewMoveDirection moveDirection = [self moveDirectionFromFrame:self.frame inBound:parentBound];
    CGRect finalFrame = [self finalFrameFrom:self.frame inBound:parentBound withDirection:moveDirection];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = finalFrame;
    } completion:^(BOOL finished) {
        self.frame = finalFrame;
    }];
    
}

- (BRDDraggableViewMoveDirection)moveDirectionFromFrame:(CGRect)frame inBound:(CGRect)parentBound
{
    CGFloat centerX = CGRectGetMidX(frame);
    CGFloat centerY = CGRectGetMidY(frame);
    
    CGFloat parentWidth = CGRectGetWidth(parentBound);
    CGFloat parentHeight = CGRectGetHeight(parentBound);
    
    CGFloat leftDistance = fabs(centerX);
    CGFloat topDistance = fabs(centerY);
    
    CGFloat rightDistance = fabs(parentWidth - centerX);
    CGFloat bottomDistance = fabs(parentHeight - centerY);
    
    CGFloat shortestDistance = MIN(MIN(leftDistance, topDistance) , MIN(rightDistance, bottomDistance));
    
    if (leftDistance <= shortestDistance) {
        return BRDDraggableViewMoveDirectionLeft;
    } else if (topDistance <= shortestDistance) {
        return BRDDraggableViewMoveDirectionTop;
    } else if (rightDistance <= shortestDistance) {
        return BRDDraggableViewMoveDirectionRight;
    } else {
        return BRDDraggableViewMoveDirectionBottom;
    }
}

- (CGRect)finalFrameFrom:(CGRect)rect inBound:(CGRect)parentBound withDirection:(BRDDraggableViewMoveDirection)direction
{
    CGRect finalFrame = rect;
    switch (direction) {
        case BRDDraggableViewMoveDirectionLeft: {
            finalFrame.origin.x = 0;
            break;
        }
        case BRDDraggableViewMoveDirectionTop: {
            finalFrame.origin.y = 0;
            break;
        }
        case BRDDraggableViewMoveDirectionRight: {
            finalFrame.origin.x = CGRectGetWidth(parentBound) - CGRectGetWidth(rect);
            break;
        }
        case BRDDraggableViewMoveDirectionBottom: {
            finalFrame.origin.y = CGRectGetHeight(parentBound) - CGRectGetHeight(rect);
            break;
        }
    }
    return finalFrame;
}




@end
