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
    
    self.detailViewTitle.text = self.item.title;
    self.detailViewDescription.text = self.item.details;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
