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

@protocol TableControllerDelegate <NSObject>
@required
- (void)performSegue:(SEBBucketItem*)item;
@end

@interface SEBTableViewController : UITableViewController
{
    id <TableControllerDelegate> tableDelegate;
}
@property (strong, nonatomic) NSArray *bucketListItems;
@property (retain) id tableDelegate;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
- (void)reload;
@end