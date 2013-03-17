//
//  SEBMapViewController.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBMapViewController.h"

@interface SEBMapViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@end

@implementation SEBMapViewController

BOOL moveMap = YES;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    /////////////////////////////////
    // Start updating map location //
    /////////////////////////////////
    CGRect frame;
    frame.origin.x = -10;
    frame.origin.y = -10;
    frame.size.width = 324;
    frame.size.height = 216;

    self.myMapView =[[MKMapView alloc] initWithFrame:frame];
    self.myMapView.showsUserLocation = YES;
    [self.view addSubview:self.myMapView];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    self.currentLocation = location;

    if (moveMap) {
        MKCoordinateSpan span = {0.01, 0.01};
        MKCoordinateRegion region = {location.coordinate, span};
        [self.myMapView setRegion:region animated:YES];
        moveMap = NO;
    }  
}


- (void)addPinToMapAtLocation:(SEBBucketItem *)item
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];

    pin.coordinate = item.location.coordinate;
    pin.title = item.name;
    pin.subtitle = item.description;
    [self.myMapView addAnnotation:pin];

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Oops..");
}

@end
