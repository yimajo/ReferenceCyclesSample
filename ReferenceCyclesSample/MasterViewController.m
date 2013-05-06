//
//  MasterViewController.m
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import "MasterViewController.h"
#import "ReferenceCycleARCViewController.h"

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"WeakSegueIdentifier"]) {
        
        ((ReferenceCycleARCViewController *)segue.destinationViewController).referenceType = ReferenceTypeWeak;
        
    } else {

        ((ReferenceCycleARCViewController *)segue.destinationViewController).referenceType = ReferenceTypeStrong;
        
    }
}

@end
