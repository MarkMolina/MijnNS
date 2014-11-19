//
//  CCObjectsFetcher.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCManagedObjectStore;

@protocol CCObjectFetcher <NSObject>

@property (nonatomic, strong) CCManagedObjectStore *managedObjectStore;

+ (void)setSharedManagedObjectStore:(CCManagedObjectStore*)managedObjectStore;
+ (CCManagedObjectStore*)sharedManagedObjectStore;
+ (void)fetch;
- (void)fetch;

@end

@interface CCObjectsFetcher : NSObject <CCObjectFetcher>

@end
