//
//  SEBAddViewController.h
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SEBAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *addViewNavBar;
@property (weak, nonatomic) IBOutlet UITextField *titleBox;
@property (weak, nonatomic) IBOutlet UITextField *descriptionBox;
@end
