//
//  CCManagedObject.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObject.h"
#import <RestKit/RestKit.h>

static CCManagedObjectStore *__sharedManagedObjectStore;

@implementation CCManagedObject

+ (void)setSharedManagedObjectStore:(CCManagedObjectStore*)managedObjectStore
{
    __sharedManagedObjectStore = managedObjectStore;
}

+ (CCManagedObjectStore*)sharedManagedObjectStore
{
    return __sharedManagedObjectStore;
}

+ (RKMapping*)mapping
{
    return nil;
}

+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore
{
    return nil;
}

@end
