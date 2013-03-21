//
//  SEBBucketItem.h
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>

@interface SEBBucketItem : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *details;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSNumber *completed;
@property (nonatomic, retain) NSDate *date;

@end
