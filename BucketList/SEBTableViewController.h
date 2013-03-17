//
//  SEBTableViewController.h
//  BucketList
//
//  Created by Sebs on 3/13/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SEBBucketItem.h"

@protocol ProcessDataDelegate <NSObject>
@required
- (void)performSegue:(SEBBucketItem*)item;
@end

@interface SEBTableViewController : UITableViewController
{
    id <ProcessDataDelegate> delegate;
}
@property (strong, nonatomic) NSMutableArray *bucketListItems;
@property (retain) id delegate;
@end