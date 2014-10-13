//
//  CCStation.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCStation.h"
#import "CCManagedObjectStore.h"

static CCManagedObjectStore* __sharedManagedObjectStore;

@implementation CCStation

@dynamic code;
@dynamic type;
@dynamic uicode;
@dynamic latitude;
@dynamic longitude;
@dynamic longName;
@dynamic mediumName;
@dynamic shortName;

+ (void)setSharedManagedObjectStore:(CCManagedObjectStore*)managedObjectStore
{
    __sharedManagedObjectStore = managedObjectStore;
}

+ (CCManagedObjectStore*)sharedManagedObjectStore
{
    if (__sharedManagedObjectStore)
        return __sharedManagedObjectStore;
    return super.sharedManagedObjectStore;
}

+ (RKMapping*)mapping
{
    return [self mappingForManagedObjectStore:self.sharedManagedObjectStore];
}

+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore
{
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass(self.class) inManagedObjectStore:managedObjectStore];
    
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"UICCode.text" : @"uicode",
                                                  @"Type.text" : @"type",
                                                  @"Code.text" : @"code",
                                                  @"Lat.text" : @"latitude",
                                                  @"Lon.text" : @"longitude",
                                                  @"Namen.Lang.text" : @"longName",
                                                  @"Namen.Middel.text" : @"mediumName",
                                                  @"Namen.Kort.text" : @"shortName"
                                                  }];
    [mapping setIdentificationAttributes:@[@"uicode"]];
    
    return mapping;
}

@end
