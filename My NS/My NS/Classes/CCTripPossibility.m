//
//  CCTripPossibility.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTripPossibility.h"
#import "CCTrip.h"
#import "CCTripPart.h"

@implementation CCTripPossibility

@dynamic actualArrivalTime;
@dynamic actualDepartureTime;
@dynamic actualTravelTime;
@dynamic optimal;
@dynamic plannedArrivalTime;
@dynamic plannedDepartureTime;
@dynamic plannedTravelTime;
@dynamic status;
@dynamic transfers;
@dynamic parts;
@dynamic trip;

+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(self.class) inManagedObjectStore:managedObjectStore];
    
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"AantalOverstappen.text" : @"transfers",
                                                  @"GeplandeReisTijd.text" : @"plannedTravelTime",
                                                  @"ActueleReisTijd.text" : @"actualTravelTime",
                                                  @"Optimaal.text" : @"optimal",
                                                  @"GeplandeVertrekTijd.text" : @"plannedDepartureTime",
                                                  @"ActueleVertrekTijd.text" : @"actualDepartureTime",
                                                  @"GeplandeAankomstTijd.text" : @"plannedArrivalTime",
                                                  @"ActueleAankomstTijd.text" : @"actualArrivalTime",
                                                  @"Status.text" : @"status"
                                                  }];
    
    //[mapping addRelationshipMappingWithSourceKeyPath:@"parts" mapping:[CCTripPart mappingForManagedObjectStore:managedObjectStore]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"ReisDeel" toKeyPath:@"parts" withMapping:[CCTripPart mappingForManagedObjectStore:managedObjectStore]]];
    
    return mapping;
}

- (NSString *)getActualArrivalTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    return [dateFormatter stringFromDate:self.actualArrivalTime];
}

- (NSString *)getActualDepartureTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    return [dateFormatter stringFromDate:self.actualDepartureTime];
}

@end
