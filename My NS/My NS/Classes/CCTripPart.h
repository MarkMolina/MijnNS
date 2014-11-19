//
//  CCTripPart.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObject.h"

@class CCTripPossibility, CCTripStop;

@interface CCTripPart : CCManagedObject

@property (nonatomic, retain) NSString * owner;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSNumber * tripid;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) CCTripPossibility *possibility;
@property (nonatomic, retain) NSSet *stops;
@end

@interface CCTripPart (CoreDataGeneratedAccessors)

//- (void)addPossibilitiesObject:(CCTripPossibility *)value;
//- (void)removePossibilitiesObject:(CCTripPossibility *)value;
- (void)addPossibilities:(NSSet *)values;
- (void)removePossibilities:(NSSet *)values;

- (void)addStopsObject:(CCTripStop *)value;
- (void)removeStopsObject:(CCTripStop *)value;
- (void)addStops:(NSSet *)values;
- (void)removeStops:(NSSet *)values;

@end
