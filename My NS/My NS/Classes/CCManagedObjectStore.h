//
//  CCManagedObjectStore.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>

@class CCTrip;

@interface CCManagedObjectStore : RKManagedObjectStore

typedef void(^CCDataStoreFetchCompletionBlock)(NSArray *results);

+ (instancetype)sharedInstance;
+ (void)setSharedManagedObjectModel:(NSManagedObjectModel*)sharedObjectModel;
+ (NSManagedObjectModel*)sharedManagedObjectModel;
+ (void)createSeedDataStore;
- (NSManagedObjectContext*)managedObjectContext;
- (CCTrip *)newTrip;
- (void)save;
- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                         forModel:(Class) model
                  completionBlock:(CCDataStoreFetchCompletionBlock)completionBlock;

@end
