//
//  SEBDetailViewController.h
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>

#import "SEBBucketItem.h"

@interface SEBDetailViewController : UIViewController 

@property (strong, nonatomic) SEBBucketItem *item;

@property (weak, nonatomic) IBOutlet UITextField *detailViewDescription;
@property (weak, nonatomic) IBOutlet UITextField *detailViewTitle;
@property (weak, nonatomic) IBOutlet MKMapView *detailViewMapView;

@property (weak, nonatomic) IBOutlet UINavigationItem *detailViewNavBar;

@end
