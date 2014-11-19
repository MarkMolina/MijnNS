//
//  CCDetailInteractor.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCDetailInteractor.h"
#import "CCDetailDataManager.h"
#import "CCServerManager.h"
#import "CCTripPossibility.h"
#import "CCTrip.h"
#import "CCStation.h"

@interface CCDetailInteractor()

@property (nonatomic, strong) CCDetailDataManager *dataManager;

@end

@implementation CCDetailInteractor

- (instancetype)initWithDataManager:(CCDetailDataManager *)dataManager {
    if ((self = [super init]))
    {
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)calculatePossibilies:(NSDictionary *)dict {
    __weak typeof(self) welf = self;
    
    [self.dataManager tripWithFrom:[dict objectForKey:@"from"] to:[dict objectForKey:@"to"] when:[dict objectForKey:@"travelDate"] completionBlock:^(NSArray *trips) {
        CCTrip *trip = [trips firstObject];
        
        [welf.output didCalculatePossibilites:trip.possibilities];
    }];
}

/*- (void)fetchAllStations {
    __weak typeof(self) welf = self;
    
    [self.dataManager createFetchedResultsControllerWithCompletion:^(NSFetchedResultsController *fetchedResultController) {
        [welf.output foundTripDetails];
    }];
}*/


@end