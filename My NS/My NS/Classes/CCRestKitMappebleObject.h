//
//  CCRestKitMappebleObject.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCManagedObjectStore;
@class RKManagedObjectStore;
@class RKMapping;

@protocol CCRestKitMappebleObject <NSObject>

+ (void)setSharedManagedObjectStore:(CCManagedObjectStore*)managedObjectStore;
+ (CCManagedObjectStore*)sharedManagedObjectStore;
+ (RKMapping*)mapping;
+ (RKMapping*)mappingForManagedObjectStore:(RKManagedObjectStore*)managedObjectStore;

@end
