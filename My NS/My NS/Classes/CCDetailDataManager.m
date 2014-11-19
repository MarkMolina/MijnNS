//
//  CCDetailDataManager.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCDetailDataManager.h"
#import "CCManagedObjectStore.h"
#import "CCTrip.h"
#import "CCStation.h"

@implementation CCDetailDataManager

@synthesize managedObjectStore = _managedObjectStore;


- (void)tripWithFrom:(CCStation *)from to:(CCStation *)to when:(NSDate *)travelDate completionBlock:(void (^)(NSArray *))completionBlock {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(from == %@) AND (to == %@) AND (travelDate = %@)", from, to, travelDate];
    NSArray *sortDescriptors = @[];
    
    [self.managedObjectStore
     fetchEntriesWithPredicate:predicate
     sortDescriptors:sortDescriptors
     forModel:[CCTrip class]
     completionBlock:^(NSArray *entries) {
         if (completionBlock)
         {
             completionBlock(entries);
         }
     }];
}

@end
