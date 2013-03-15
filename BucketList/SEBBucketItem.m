//
//  SEBBucketItem.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBBucketItem.h"

@interface SEBBucketItem ()



@end

@implementation SEBBucketItem

- (id) initWithTitle:(NSString *)name description:(NSString *)description location:(CLLocation *)location {

    self = [super init];
    if( !self ) return nil;

    self.name = name;
    self.description = description;
    self.location = location;
    self.done = NO;

    return self;
}


@end
