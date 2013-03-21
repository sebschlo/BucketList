//
//  SEBViewController.m
//  BucketList
//
//  Created by Sebs on 3/11/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBViewController.h"

@interface SEBViewController ()

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) SEBMapViewController *myMapView;
@property (strong, nonatomic) SEBTableViewController *myTableView;
@property (strong, nonatomic) SEBBucketItem *lastItem;
@property (strong, nonatomic) SEBDataManager *dm;

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
    
    UIView *background = [[UIView alloc] init];
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = 304;
    frame.size.height = 196;
    background.frame = frame;
    background.alpha = 0.5;
    background.backgroundColor = [UIColor grayColor];
    
    [tableContainer addSubview:background];


    self.myTableView = [[SEBTableViewController alloc] initWithStyle: UITableViewStylePlain];



    self.myTableView.tableView.frame = frame;
    self.myTableView.tableView.backgroundColor = [UIColor clearColor];
    [self.myTableView.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

    [tableContainer addSubview:self.myTableView.tableView];

    // Protocol setup
    [_myTableView setDelegate:self];

    _dm = [[SEBDataManager alloc] init];

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
                                                        message:@"Please to to Settings>Privacy and re-enable it."
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


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        // Get reference to the destination view controller
        SEBDetailViewController *vc = [segue destinationViewController];

        // Pass any objects to the view controller here, like...
        [vc setItem:_lastItem];
    }
}

- (void)performSegue:(SEBBucketItem *)item {
    _lastItem = item;
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

- (IBAction)unwindFromSEBAddViewController:(UIStoryboardSegue *)segue {

    // Get the segue controller
    SEBAddViewController *segueController = [segue sourceViewController];

    // Get the current location
    CLLocation *location = self.myMapView.currentLocation;

    // Add item to array
    [_dm addItemWithTitle:segueController.titleBox.text details:segueController.descriptionBox.text latitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    [_myTableView reload];

}

@end
