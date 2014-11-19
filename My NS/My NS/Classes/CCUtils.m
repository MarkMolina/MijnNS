//
//  CCUtils.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCUtils.h"

@implementation CCUtils

+ (NSString*)dictionaryToString:(NSDictionary*)dictionary prependedWith:(NSString*)prependendWith
{
    NSString *ret = [[NSString alloc] init];
    NSString *prepend = prependendWith;
    for (id key in dictionary) {
        
        ret = [ret stringByAppendingString:[NSString stringWithFormat:@"%@%@=%@", prepend, key, dictionary[key]]];
        prepend = @"&";
    }
    return ret;
}

@end
