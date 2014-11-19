//
//  CCTrip.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObject.h"

@class CCStation, CCManagedObject, CCTripPossibility;

@interface CCTrip : CCManagedObject

@property (nonatomic, retain) NSNumber * departure;
@property (nonatomic, retain) NSDate * travelDate;
@property (nonatomic, retain) CCStation *from;
@property (nonatomic, retain) NSSet *possibilities;
@property (nonatomic, retain) CCStation *to;
@property (nonatomic, retain) CCStation *via;
@property (nonatomic) BOOL loaded;

@end

@interface CCTrip (CoreDataGeneratedAccessors)

- (void)addPossibilitiesObject:(CCTripPossibility *)value;
- (void)removePossibilitiesObject:(CCTripPossibility *)value;
- (void)addPossibilities:(NSSet *)values;
- (void)removePossibilities:(NSSet *)values;
- (NSString *)apiTravelDate;
- (NSString *)departureTime;
- (NSString *)departureDate;

@end
