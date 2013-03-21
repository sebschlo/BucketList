//
//  SEBTableViewController.m
//  BucketList
//
//  Created by Sebs on 3/13/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBTableViewController.h"
#import "SEBDataManager.h"


#define kSEBCellIdentifier @"My Cell Identifier"

@interface SEBTableViewController ()
@property (strong, nonatomic) SEBDataManager *dm;
@end

@implementation SEBTableViewController
@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.dm = [[SEBDataManager alloc] init];
    self.bucketListItems = [self.dm getAllItems];
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
    cell.textLabel.text = item.title;

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SEBBucketItem *item = [self.bucketListItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [[self delegate] performSegue:item];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.imageView.image = [UIImage imageNamed:@"bucketItem.png"];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell.imageView setBackgroundColor:[UIColor whiteColor]];
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Delete action
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dm deleteItem:[self.bucketListItems objectAtIndex:indexPath.row]];
    }
    [self reload];
}

- (void)reload {
    self.bucketListItems = [self.dm getAllItems];
    [self.tableView reloadData];
}


@end
