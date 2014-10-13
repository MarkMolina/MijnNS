//
//  CCAddInteractor.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAddInteractor.h"
#import "CCTripModel.h"
#import "CCAddDataManager.h"

@interface CCAddInteractor()


@property (nonatomic, strong) CCAddDataManager *dataManager;
@property (nonatomic, strong) CCTripModel *trip;

@end

@implementation CCAddInteractor

- (instancetype)initWithDataManager:(CCAddDataManager *)dataManager
{
    if ((self = [super init]))
    {
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)addNewTrip {
    _trip = [CCTripModel addTrip];
}

- (void)setFromStation:(CCStation *)station {
    [_trip setFromStation:station];
}

- (void)setViaStation:(CCStation *)station {
    [_trip setViaStation:station];
}

- (void)setToStation:(CCStation *)station {
    [_trip setToStation:station];
}

- (void)setDepartureArrival:(NSInteger)index {
    switch (index) {
        case 0:
            [_trip setDeparture:[NSNumber numberWithBool:YES]];
            break;
        case 1:
            [_trip setDeparture:[NSNumber numberWithBool:NO]];
            break;
            
        default:
            break;
    }
}

- (void)setTravelDate:(NSDate *)date {
    [_trip setTravelDate:date];
}

- (void)saveTrip {
    [self.dataManager addNewTrip:_trip];
}

@end
