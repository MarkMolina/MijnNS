//
//  CCTripStop.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTripStop.h"


@implementation CCTripStop

@dynamic name;
@dynamic time;
@dynamic track;
@dynamic part;

+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(self.class) inManagedObjectStore:managedObjectStore];
    
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"Naam.text" : @"name",
                                                  @"Tijd.text" : @"time",
                                                  @"Spoor.text" : @"track"
                                                  }];
    
    return mapping;
}

@end
