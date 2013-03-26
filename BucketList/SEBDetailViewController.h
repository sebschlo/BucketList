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

@protocol DetailControllerDelegate <NSObject>
@required
- (void)reloadTable;
- (void)toggleBucketItemDone:(SEBBucketItem *)item;
- (void)updateBucketItem:(SEBBucketItem *)item withTitle:(NSString *)title details:(NSString *)details;

@end

@interface SEBDetailViewController : UIViewController 
{
    id <DetailControllerDelegate> detailDelegate;
}
@property (retain) id detailDelegate;

@property (strong, nonatomic) SEBBucketItem *item;

@property (weak, nonatomic) IBOutlet UITextField *detailViewDescription;
@property (weak, nonatomic) IBOutlet UITextField *detailViewTitle;
@property (weak, nonatomic) IBOutlet MKMapView *detailViewMapView;
@property (weak, nonatomic) IBOutlet UILabel *detailViewDate;
@property (weak, nonatomic) IBOutlet UIButton *detailViewDone;

@property (weak, nonatomic) IBOutlet UINavigationItem *detailViewNavBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;


@end
