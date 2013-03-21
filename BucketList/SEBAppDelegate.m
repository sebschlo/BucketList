//
//  SEBAppDelegate.m
//  BucketList
//
//  Created by Sebs on 3/11/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBAppDelegate.h"
#import "SEBViewController.h"

@interface SEBAppDelegate ()
@property (strong, nonatomic) SEBViewController *vc;
@end

@implementation SEBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Get the SEbbViewController
    NSArray *array = self.window.rootViewController.childViewControllers;
    for (int i=0; i<[array count]; i++) {
        if ([[array objectAtIndex:i] isKindOfClass:[SEBViewController class]]) {
            _vc = [array objectAtIndex:i];
        }
    }

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

    if (_vc) {
        NSLog(@"stopped using location");
        [_vc stopGettingLocation];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    if (_vc) {
        NSLog(@"stopped using location");
        [_vc startGettingLocation];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
