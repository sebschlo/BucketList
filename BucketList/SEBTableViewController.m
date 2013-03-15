//
//  SEBTableViewController.m
//  BucketList
//
//  Created by Sebs on 3/13/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBTableViewController.h"
#import "SEBBucketItem.h"

#define kSEBCellIdentifier @"My Cell Identifier"

@interface SEBTableViewController ()
@end

@implementation SEBTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.bucketListItems = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bucketListItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kSEBCellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSEBCellIdentifier];
    }

    SEBBucketItem *item = [self.bucketListItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;

    return cell;
}

@end
