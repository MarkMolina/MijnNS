//
//  CCMyTripInteractor.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripInteractor.h"
#import "CCMyTripDataManager.h"
#import "CCMyTripDataManager.h"
#import "CCServerManager.h"
#import "CCTripPossibility.h"
#import "CCTrip.h"
#import "CCStation.h"

@interface CCMyTripInteractor()

@property (nonatomic, strong)   CCMyTripDataManager *dataManager;

@end

@implementation CCMyTripInteractor

- (instancetype)initWithDataManager:(CCMyTripDataManager *)dataManager {
    if ((self = [super init]))
    {
        _dataManager = dataManager;
        [[CCServerManager sharedInstance] setDelegate:self];
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

- (void)fetchTripPossibilitesForTrip:(CCTrip *)trip {
    
    if (!trip.loaded) {
        [[CCServerManager sharedInstance] fetchTripPossibilitesFrom:trip.from.code To:trip.to.code when:trip.apiTravelDate];
    }
}

- (void)didFetchTripPossibilities:(NSArray *)array withProperties:(NSDictionary *)properties {
    [_dataManager tripFrom:[properties objectForKey:@"from"] to:[properties objectForKey:@"to"] date:[properties objectForKey:@"travelDate"] completionBlock:^(NSArray *trips) {

        
        CCTrip *trip = nil;
        for (CCTrip *t in trips) {
            if ([t.apiTravelDate isEqualToString:[properties objectForKey:@"travelDate"]] && !t.loaded) {
                trip = t;
                break;
            }
        }
        
        
        for (CCTripPossibility *tp in array) {
            
            [trip addPossibilitiesObject:tp];
            [trip setLoaded:YES];
            NSError *error;
            if ([trip.managedObjectContext hasChanges]) {
                if ([trip.managedObjectContext saveToPersistentStore:&error]) {
                    NSLog(@"Saved Trip possibility");
                } else {
                    NSLog(@"Failed saving to Trip: %@", error.localizedDescription);
                    
                }
            }
            
        }
        
        
    }];
}

- (NSString *)getActualArrivalTimeForTrip:(CCTrip *)trip {
    for (CCTripPossibility *tp in trip.possibilities) {
        if (tp.optimal) {
            return tp.getActualArrivalTime;
        }
    }
    return nil;
}

- (NSString *)getActualDepartureTimeForTrip:(CCTrip *)trip {
    for (CCTripPossibility *tp in trip.possibilities) {
        if (tp.optimal) {
            return tp.getActualDepartureTime;
        }
    }
    return nil;
}

@end
