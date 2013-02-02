//
//  ClockUtility
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import "ClockUtility.h"


@interface ClockUtility ()

@property (copy, nonatomic) void (^action)(NSUInteger counter);

@property (nonatomic) NSUInteger counter;

@end

@implementation ClockUtility

- (void)dealloc
{
    NSLog(@"dealloc %@",self.class);
}

- (void)tick:(void(^)(NSUInteger counter))tick;
{
	self.counter = 0;
	
	self.action = tick;

	self.tickTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
													  target:self
													selector:@selector(tickAction:)
													userInfo:nil
													 repeats:YES];
}

- (void)tickAction:(NSTimer *)timer
{
	self.counter++;

	self.action(self.counter);
}



@end
