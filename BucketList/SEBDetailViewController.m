//
//  SEBDetailViewController.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBDetailViewController.h"

@interface SEBDetailViewController ()


@end

@implementation SEBDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.detailViewMapView.layer.cornerRadius = 10;
    self.detailViewMapView.layer.borderWidth = 2;
    MKCoordinateSpan span = {0.05, 0.05};
    MKCoordinateRegion region = {self.item.location.coordinate, span};
    [self.detailViewMapView setRegion:region animated:YES];
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = self.item.location.coordinate;
    [self.detailViewMapView addAnnotation:pin];
    
    self.detailViewTitle.text = self.item.name;
    self.detailViewDescription.text = self.item.description;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
