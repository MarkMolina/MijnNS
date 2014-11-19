//
//  CCTrip.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTrip.h"
#import "CCStation.h"
#import "CCTripPossibility.h"


@implementation CCTrip

@dynamic departure;
@dynamic travelDate;
@dynamic from;
@dynamic possibilities;
@dynamic to;
@dynamic via;
@dynamic loaded;

- (void)addPossibilitiesObject:(CCTripPossibility *)value {
    NSMutableSet *set = [self mutableSetValueForKey:@"possibilities"];
    [set addObject:[self.managedObjectContext objectWithID:[value objectID]]];
}

- (NSString *)apiTravelDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    
    return [dateFormatter stringFromDate:self.travelDate];
}

- (NSString *)departureTime {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    return [dateFormatter stringFromDate:self.travelDate];
}

- (NSString *)departureDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"EEE MMM dd"];
    
    return [dateFormatter stringFromDate:self.travelDate];
}


@end
