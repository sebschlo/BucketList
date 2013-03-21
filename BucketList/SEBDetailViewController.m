//
//  SEBDetailViewController.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBDetailViewController.h"
#import "SEBDataManager.h"

@interface SEBDetailViewController ()
@property (strong, nonatomic) SEBDataManager *dm;
@end

@implementation SEBDetailViewController
@synthesize detailDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    //Add navbar image
    self.detailViewNavBar.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navBarImage.png"]];

    //Setup map
    self.detailViewMapView.layer.cornerRadius = 10;
    self.detailViewMapView.layer.borderWidth = 2;
    MKCoordinateSpan span = {0.05, 0.05};
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([self.item.latitude doubleValue], [self.item.longitude doubleValue]);
    MKCoordinateRegion region = {loc, span};
    [self.detailViewMapView setRegion:region animated:YES];
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = loc;
    [self.detailViewMapView addAnnotation:pin];

    //Setup fields
    self.detailViewTitle.text = self.item.title;
    self.detailViewDescription.text = self.item.details;

    self.dm = [[SEBDataManager alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editItem:(id)sender {
    
    if ([self.editButton.title isEqualToString:@"Edit"]) {
        self.editButton.title = @"DONE";
        self.detailViewDescription.enabled = YES;
        self.detailViewTitle.enabled = YES;
    } else if ([self.editButton.title isEqualToString:@"DONE"]){
        self.editButton.title = @"Edit";
        self.detailViewTitle.enabled = NO;
        self.detailViewDescription.enabled = NO;
        [self.dm updateItem:_item withTitle:self.detailViewTitle.text details:self.detailViewDescription.text];
        [[self detailDelegate] reloadTable];
    }

}

@end
