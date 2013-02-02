//
//  ReferenceCycleARCViewController.m
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import "ReferenceCycleARCViewController.h"
#import "ClockUtility.h"

@interface ReferenceCycleARCViewController ()

@property (strong, nonatomic) ClockUtility *clockUtility;

@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation ReferenceCycleARCViewController

- (void)dealloc
{
	[[[UIAlertView alloc] initWithTitle:nil
								message:[NSString stringWithFormat:@"循環参照せずdeallocできた %@", self.class]
							  delegate:nil
					 cancelButtonTitle:nil
					 otherButtonTitles:@"OK", nil] show];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//循環参照するパターン
	[self sup];
	
	//循環参照しないパターン
//	[self supNoReferenceCycle];
}

- (void)sup
{
	//blocksの呼び出し元を保持している状態に
	self.clockUtility = [[ClockUtility alloc] init];
	
	//blocksを呼び出す
	[self.clockUtility tick:^(NSUInteger counter){
		//selfを強参照
		self.counterLabel.text = [NSString stringWithFormat:@"%d" , counter];
		
		if (5 < counter) {
			//selfを強参照
			[self.clockUtility.tickTimer invalidate];
		}
	}];
	
}

- (void)supNoReferenceCycle
{
	//blocksの呼び出し元を保持している状態に
	self.clockUtility = [[ClockUtility alloc] init];

	//selfを弱参照するように
	__weak ReferenceCycleARCViewController *viewController = self;
	
	//blocksを呼び出す
	[self.clockUtility tick:^(NSUInteger counter){
		//selfを弱参照
		//selfを強参照
		viewController.counterLabel.text = [NSString stringWithFormat:@"%d" , counter];

		if (5 < counter) {
			//selfを弱参照
			[viewController.clockUtility.tickTimer invalidate];
		}
	}];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[self setCounterLabel:nil];
	[super viewDidUnload];
}
@end
