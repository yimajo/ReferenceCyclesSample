//
//  ClockUtility
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockUtility : NSObject

@property (weak, nonatomic) NSTimer *tickTimer;

- (void)tick:(void(^)(NSUInteger counter))tick;

@end
