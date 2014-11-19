//
//  CCObjectsFetcher.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCObjectsFetcher.h"

static CCManagedObjectStore *__sharedManagedObjectStore;

@implementation CCObjectsFetcher

@synthesize managedObjectStore = _managedObjectStore;

+ (void)setSharedManagedObjectStore:(CCManagedObjectStore*)managedObjectStore
{
    __sharedManagedObjectStore = managedObjectStore;
}

+ (CCManagedObjectStore*)sharedManagedObjectStore
{
    return __sharedManagedObjectStore;
}

+ (void)fetch
{
    [[self new] fetch];
}

- (void)fetch
{
}

- (void)setManagedObjectStore:(CCManagedObjectStore*)managedObjectStore
{
    _managedObjectStore = managedObjectStore;
}

- (CCManagedObjectStore*)managedObjectStore
{
    if (_managedObjectStore)
        return _managedObjectStore;
    return self.class.sharedManagedObjectStore;
}

@end