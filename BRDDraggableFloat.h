//
//  BRDDraggableFloat.h
//  BridestoryForBusiness
//
//  Created by Ibnu Sina on 12/14/17.
//  Copyright © 2017 Bridestory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRDDraggableFLoatWindow.h"

@interface BRDDraggableFloat : NSObject

@property (nonatomic, strong) BRDDraggableFLoatWindow *window;

+ (BRDDraggableFloat *)sharedInstance;

@end
