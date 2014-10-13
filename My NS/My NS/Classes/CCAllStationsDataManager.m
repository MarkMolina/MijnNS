//
//  CCAllStationsDataManager.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsDataManager.h"
#import "CCManagedObjectStore.h"
#import "CCStation.h"

@implementation CCAllStationsDataManager

//@synthesize applicationInteractor = _applicationInteractor;
@synthesize managedObjectStore = _managedObjectStore;

- (void)createFetchedResultsControllerWithCompletion:(void (^)(NSFetchedResultsController *fetchedResultController))completionBlock {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass(CCStation.class)];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"longName" ascending:YES];
    
    // TODO: Make scalable by using limit/offset and lazy load table view
    //[fetchRequest setFetchLimit:100];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectStore.managedObjectContext;
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:@"longName" cacheName:nil];
    
    [fetchedResultsController performFetch:nil];
    
    completionBlock(fetchedResultsController);
}

@end
