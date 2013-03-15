//
//  SEBBucketItem.h
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SEBBucketItem : NSObject
- (id) initWithTitle:(NSString *)name description:(NSString *)description location:(CLLocation *)location;
@end
