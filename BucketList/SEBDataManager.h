//
//  SEBDataManager.h
//  BucketList
//
//  Created by Sebs on 3/18/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SEBBucketItem;

@interface SEBDataManager : NSObject

- (BOOL)addItemWithTitle:(NSString *)title details:(NSString *)details latitude:(double)lat longitude:(double)lon;
- (NSArray *)getAllItems;
- (BOOL)updateItem:(SEBBucketItem *)item withTitle:(NSString *)title details:(NSString *)details;
- (BOOL)deleteItem:(SEBBucketItem *)item;
- (BOOL)toggleItemDone:(SEBBucketItem *)item;
- (BOOL)deleteAllItems;

@end
