//
//  CCTripPossibility.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObject.h"

@class CCTrip;

@interface CCTripPossibility : CCManagedObject

@property (nonatomic, retain) NSDate * actualArrivalTime;
@property (nonatomic, retain) NSDate * actualDepartureTime;
@property (nonatomic, retain) NSDate * actualTravelTime;
@property (nonatomic, retain) NSNumber * optimal;
@property (nonatomic, retain) NSDate * plannedArrivalTime;
@property (nonatomic, retain) NSDate * plannedDepartureTime;
@property (nonatomic, retain) NSDate * plannedTravelTime;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSNumber * transfers;
@property (nonatomic, retain) NSSet *parts;
@property (nonatomic, retain) CCTrip *trip;
@end

@interface CCTripPossibility (CoreDataGeneratedAccessors)

- (void)addPartsObject:(NSManagedObject *)value;
- (void)removePartsObject:(NSManagedObject *)value;
- (void)addParts:(NSSet *)values;
- (void)removeParts:(NSSet *)values;

- (NSString *)getActualDepartureTime;
- (NSString *)getActualArrivalTime;

@end
