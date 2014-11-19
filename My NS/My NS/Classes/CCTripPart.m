//
//  CCTripPart.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTripPart.h"
#import "CCTripPossibility.h"
#import "CCTripStop.h"


@implementation CCTripPart

@dynamic owner;
@dynamic status;
@dynamic tripid;
@dynamic type;
@dynamic possibility;
@dynamic stops;

+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(self.class) inManagedObjectStore:managedObjectStore];
    
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"Vervoerder.text" : @"owner",
                                                  @"VervoerType.text" : @"type",
                                                  @"RitNummer.text" : @"tripid",
                                                  @"Status.text" : @"status"
                                                  }];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"ReisStop" toKeyPath:@"stops" withMapping:[CCTripStop mappingForManagedObjectStore:managedObjectStore]]];
    
    return mapping;
}

@end
