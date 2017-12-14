//
//  BRDDraggableFloat.m
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import "BRDDraggableFloat.h"

@implementation BRDDraggableFloat

+ (BRDDraggableFloat *)sharedInstance
{
    static BRDDraggableFloat *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if(sharedInstance == nil) {
            sharedInstance = [[BRDDraggableFloat alloc] init];
        }
    });
    return sharedInstance;
}

- (BRDDraggableFLoatWindow *)window
{
    if (!_window) {
        _window = [[BRDDraggableFLoatWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}

@end
