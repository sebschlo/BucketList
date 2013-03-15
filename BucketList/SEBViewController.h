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


@interface SEBViewController : UIViewController

- (void)stopGettingLocation;
- (void)startGettingLocation;

- (void) addLocation:(NSString *)title description:(NSString *)description location:(CLLocation *)location;

@end
