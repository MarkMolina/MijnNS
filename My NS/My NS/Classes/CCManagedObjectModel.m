//
//  CCManagedObjectModel.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObjectModel.h"

@implementation CCManagedObjectModel

+ (instancetype)defaultManagedObjectModel
{
    NSString *modelName = @"My_NS";//NSBundle.mainBundle.infoDictionary[@"CFBundleName"];
    NSURL *modelURL = [NSBundle.mainBundle URLForResource:modelName withExtension:@"momd"];
    return [[[self alloc] initWithContentsOfURL:modelURL] mutableCopy];
}

@end