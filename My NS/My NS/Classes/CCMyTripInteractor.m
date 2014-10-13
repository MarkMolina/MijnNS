//
//  CCMyTripInteractor.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripInteractor.h"
#import "CCMyTripDataManager.h"

@interface CCMyTripInteractor()

@property (nonatomic, strong)   CCMyTripDataManager *dataManager;

@end

@implementation CCMyTripInteractor

- (instancetype)initWithDataManager:(CCMyTripDataManager *)dataManager {
    if ((self = [super init]))
    {
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)fetchMyTrips {
    __weak typeof(self) welf = self;
    
    [self.dataManager fetchMyTripsWithCompletionBlock:^(NSFetchedResultsController *fetchedResultController) {
        [welf.output fetchedMyTrips:fetchedResultController];
    }];
}

- (void)deleteTrip:(CCTrip *)trip {
    [self.dataManager deleteTrip:trip];
}

@end
