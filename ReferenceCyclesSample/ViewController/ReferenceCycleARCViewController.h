//
//  ReferenceCycleARCViewController.h
//  ReferenceCyclesSample
//
//  Created by yimajo on 2013/02/02.
//  Copyright (c) 2013年 yimajo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ReferenceTypeWeak,
    ReferenceTypeStrong,
} ReferenceType;

@interface ReferenceCycleARCViewController : UIViewController

@property (assign, nonatomic) ReferenceType referenceType;

@end
