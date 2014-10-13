//
//  CCAllStationsDataManager.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//
#import "CCModuleInteractor.h"

@interface CCAllStationsDataManager : NSObject <CCModuleInteractor>

- (void)createFetchedResultsControllerWithCompletion:(void (^)(NSFetchedResultsController *fetchedResultController))completionBlock;

@end
