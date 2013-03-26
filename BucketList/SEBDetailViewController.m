//
//  SEBDetailViewController.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBDetailViewController.h"
#import "SEBDataManager.h"


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
    MKCoordinateSpan span = {0.01, 0.01};
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([self.item.latitude doubleValue], [self.item.longitude doubleValue]);
    MKCoordinateRegion region = {loc, span};
    [self.detailViewMapView setRegion:region animated:YES];
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = loc;
    [self.detailViewMapView addAnnotation:pin];

    //Setup fields
    self.detailViewTitle.text = self.item.title;
    self.detailViewDescription.text = self.item.details;
    
    //Date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.item.date];
    self.detailViewDate.text = stringFromDate;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleDone:(id)sender {
    if ([self.detailViewDone.titleLabel.text isEqualToString:@"Mark as Done!"]) {
        [self.detailViewDone setTitle:@"Mark as Undone" forState:UIControlStateNormal];
    } else if ([self.detailViewDone.titleLabel.text isEqualToString:@"Mark as Undone"]) {
        [self.detailViewDone setTitle:@"Mark as Done!" forState:UIControlStateNormal];
    }
    [[self detailDelegate] toggleBucketItemDone:self.item];
}

- (IBAction)editItem:(id)sender {
    
    if ([self.editButton.title isEqualToString:@"Edit"]) {
        self.editButton.title = @"DONE";
        self.detailViewDescription.enabled = YES;
        self.detailViewTitle.enabled = YES;
        [self.detailViewTitle becomeFirstResponder];
    } else if ([self.editButton.title isEqualToString:@"DONE"]){
        self.editButton.title = @"Edit";
        self.detailViewTitle.enabled = NO;
        self.detailViewDescription.enabled = NO;
        [[self detailDelegate] updateBucketItem: self.item withTitle:self.detailViewTitle.text details:self.detailViewDescription.text];
    }

}

@end
