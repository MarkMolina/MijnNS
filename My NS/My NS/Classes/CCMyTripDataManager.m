//
//  CCMyTripDataManager.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripDataManager.h"
#import "CCManagedObjectStore.h"
#import "CCTrip.h"

@implementation CCMyTripDataManager

//@synthesize applicationInteractor = _applicationInteractor;
@synthesize managedObjectStore = _managedObjectStore;

- (void)fetchMyTripsWithCompletionBlock:(void (^)(NSFetchedResultsController *fetchedResultController))completionBlock {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass(CCTrip.class)];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"travelDate" ascending:YES];
    
    // TODO: Make scalable by using limit/offset and lazy load table view
    //[fetchRequest setFetchLimit:100];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectStore.managedObjectContext;
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    [fetchedResultsController performFetch:nil];
    
    completionBlock(fetchedResultsController);
}

- (void)deleteTrip:(CCTrip *)trip {
    [self.managedObjectStore.managedObjectContext deleteObject:trip];
    [self.managedObjectStore save];
}

@end
