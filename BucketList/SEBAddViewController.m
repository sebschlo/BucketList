//
//  SEBAddViewController.m
//  BucketList
//
//  Created by Sebs on 3/14/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBAddViewController.h"

@interface SEBAddViewController ()
@end

@implementation SEBAddViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    self.addViewNavBar.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navBarImage.png"]];
    [self.titleBox becomeFirstResponder];
    self.descriptionBox.layer.cornerRadius = 5;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareDescriptionBox {
    self.descriptionBox.text = @"";
    self.descriptionBox.textColor = [UIColor blackColor];
}

@end
