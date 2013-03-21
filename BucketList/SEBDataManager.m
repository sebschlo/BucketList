//
//  SEBDataManager.m
//  BucketList
//
//  Created by Sebs on 3/18/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBDataManager.h"
#import <CoreData/CoreData.h>
#import "SEBBucketItem.h"

#define kSEBEntityName @"BucketListItem"
#define kSEBSaveError @"Whoops, couldn't save: %@"


@interface SEBDataManager ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation SEBDataManager


- (BOOL)addItemWithTitle:(NSString *)title details:(NSString *)details latitude:(double)lat longitude:(double)lon {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    SEBBucketItem *item = [NSEntityDescription insertNewObjectForEntityForName:kSEBEntityName inManagedObjectContext:context];
    item.title = title;
    item.details = details;
    item.latitude = [NSNumber numberWithDouble:lat];
    item.longitude = [NSNumber numberWithDouble:lon];
    item.completed = NO;
    item.date = [NSDate date];

    NSError *error;
    if (![context save:&error]) {
        NSLog(kSEBSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}


- (NSArray *)getAllItems {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:kSEBEntityName inManagedObjectContext:context];

    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"date" ascending:YES];
    [fetchRequest setSortDescriptors:@[sort]];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];

    return fetchedObjects;
}


- (BOOL)updateItem:(SEBBucketItem *)item withTitle:(NSString *)title details:(NSString *)details {
    NSManagedObjectContext *context = [self managedObjectContext];
    item.title = title;
    item.details = details;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(kSEBSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}


- (BOOL)deleteItem:(SEBBucketItem *)item {
    NSManagedObjectContext *context = [self managedObjectContext];
    [context deleteObject:item];
    NSError *error;
    if (![context save:&error]) {
        NSLog(kSEBSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}


- (BOOL)toggleItemDone:(SEBBucketItem *)item {
    NSManagedObjectContext *context = [self managedObjectContext];
    if ([item.completed boolValue] == NO) {
        item.completed = [NSNumber numberWithBool:YES];
    } else if ([item.completed boolValue] == YES) {
        item.completed = [NSNumber numberWithBool:NO];
    }

    NSError *error;
    if (![context save:&error]) {
        NSLog(kSEBSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}


- (BOOL)deleteAllItems {
    NSArray *allItems = [self getAllItems];
    for (SEBBucketItem *item in allItems) {
        if (![self deleteItem:item]) {
            return NO;
        }
    }
    return YES;
}




#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BucketList" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Items.sqlite"];

    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.

         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.


         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.

         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]

         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];

         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.

         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end