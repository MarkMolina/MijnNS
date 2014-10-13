//
//  CCSeedAppDelegate.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCSeedAppDelegate.h"
#import "CCManagedObjectStore.h"
#import "CCManagedObjectModel.h"

@implementation CCSeedAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CCManagedObjectStore setSharedManagedObjectModel:CCManagedObjectModel.defaultManagedObjectModel];
    
    [CCManagedObjectStore createSeedDataStore];
    
    return NO;
}


@end
