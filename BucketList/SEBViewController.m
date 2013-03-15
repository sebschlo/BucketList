//
//  SEBViewController.m
//  BucketList
//
//  Created by Sebs on 3/11/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBViewController.h"
#import "SEBAddViewController.h"
#import "SEBDetailViewController.h"
#import "SEBMapViewController.h"
#import "SEBTableViewController.h"
#import "SEBBucketItem.h"


@interface SEBViewController ()

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) SEBMapViewController *myMapView;
@property (strong, nonatomic) SEBTableViewController *myTableView;

@end

@implementation SEBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navBar.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navBarImage.png"]];

    /////////////
    // Add Map //
    /////////////
    self.myMapView = [[SEBMapViewController alloc] init];

    CGRect frame;

    frame.origin.x = 8;
    frame.origin.y = 8;
    frame.size.width = 304;
    frame.size.height = 240;

    _myMapView.view.frame = frame;
    _myMapView.view.clipsToBounds = YES;
    _myMapView.view.layer.cornerRadius = 10;
    _myMapView.view.layer.borderWidth = 2;

    [self.view addSubview:[_myMapView view]];

    
    ///////////////////////
    // Create table view //
    ///////////////////////

    UIView *tableContainer = [[UIView alloc] init];

    frame.origin.y = 212;
    frame.size.width = 304;
    frame.size.height = 196;

    tableContainer.frame = frame;
    tableContainer.clipsToBounds = YES;
    tableContainer.layer.cornerRadius = 10;
    tableContainer.layer.borderWidth = 2;

    [self.view addSubview:tableContainer];

    self.myTableView = [[SEBTableViewController alloc] initWithStyle: UITableViewStyleGrouped];

    frame.origin.x = -10;
    frame.origin.y = -10;
    frame.size.width = 324;
    frame.size.height = 216;

    self.myTableView.tableView.frame = frame;
    self.myTableView.tableView.alpha = 0.6;
    [tableContainer addSubview:self.myTableView.tableView];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stopGettingLocation {
    [self.myMapView.locationManager stopUpdatingLocation];
}

- (void)startGettingLocation {
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized ) {

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled!"
                                                        message:@"Please to to Settings and re-enable it."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        CLLocationManager *manager = self.myMapView.locationManager;
        if (manager) {
            [manager startUpdatingLocation];
        }
    }
}

- (IBAction)unwindFromSEBAddViewController:(UIStoryboardSegue *)segue {
    // Get the segue controller
    SEBAddViewController *segueController = [segue sourceViewController];

    // Get the current location
    CLLocation *location = self.myMapView.currentLocation;

    // Add item to array
    SEBBucketItem *item = [[SEBBucketItem alloc] initWithTitle:segueController.titleBox.text description:segueController.descriptionBox.text location:location];
    [self.myTableView.bucketListItems addObject:item];

}

- (void)addLocation:(NSString *)title description:(NSString *)description location:(CLLocation *)location {

}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addSegue"]) {

    } 
}

@end
