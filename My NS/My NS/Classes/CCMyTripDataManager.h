//
//  CCMyTripDataManager.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCModuleInteractor.h"

@class CCTrip;

@interface CCMyTripDataManager : NSObject <CCModuleInteractor>


- (void)fetchMyTripsWithCompletionBlock:(void (^)(NSFetchedResultsController *fetchedResultController))completionBlock;
- (void)deleteTrip:(CCTrip *)trip;

@end
