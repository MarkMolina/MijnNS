//
//  main.m
//  My NS
//
//  Created by Mark Molina on 10/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
#ifndef GENERATE_SEED_DB
        return UIApplicationMain(argc, argv, nil, @"CCAppDelegate");
#else
        return UIApplicationMain(argc, argv, nil, @"CCSeedAppDelegate");
#endif
    }
}
