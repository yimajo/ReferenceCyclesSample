//
//  DetailViewController.h
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
