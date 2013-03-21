//
//  SEBViewController.h
//  BucketList
//
//  Created by Sebs on 3/11/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreLocation/CoreLocation.h>

#import "SEBAddViewController.h"
#import "SEBDetailViewController.h"
#import "SEBMapViewController.h"
#import "SEBTableViewController.h"
#import "SEBBucketItem.h"
#import "SEBDataManager.h"

@interface SEBViewController : UIViewController <TableControllerDelegate, DetailControllerDelegate>

- (void)stopGettingLocation;
- (void)startGettingLocation;

@end
