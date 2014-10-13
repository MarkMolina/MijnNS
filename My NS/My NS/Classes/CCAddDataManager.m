//
//  CCAddDataManager.m
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAddDataManager.h"
#import "CCManagedObjectStore.h"
#import "CCTrip.h"
#import "CCTripModel.h"

@implementation CCAddDataManager

//@synthesize applicationInteractor = _applicationInteractor;
@synthesize managedObjectStore = _managedObjectStore;

- (void)addNewTrip:(CCTripModel *)tripModel {
    CCTrip *trip = [self.managedObjectStore newTrip];
    trip.departure = tripModel.departure;
    trip.travelDate = tripModel.travelDate;
    trip.to = tripModel.toStation;
    trip.via = tripModel.viaStation;
    trip.from = tripModel.fromStation;
    
    [self.managedObjectStore save];
}

@end
