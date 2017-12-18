//
//  BRDDraggableView.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/15/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableView.h"

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
    CGPoint center = pgr.view.center;
    CGPoint translation = [pgr translationInView:pgr.view];
    center = CGPointMake(center.x + translation.x,
                         center.y + translation.y);
    pgr.view.center = center;
    [pgr setTranslation:CGPointZero inView:pgr.view];
}

-(void)handleTap:(UIPanGestureRecognizer*)tgr
{
    if (self.tapHandler) {
        self.tapHandler(tgr.view);
    }
}


@end
