//
//  CCTripModel.h
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCStation;

@interface CCTripModel : NSObject

@property (nonatomic, strong) NSNumber *departure;
@property (nonatomic, strong) NSDate *travelDate;
@property (nonatomic, strong) CCStation *toStation;
@property (nonatomic, strong) CCStation *viaStation;
@property (nonatomic, strong) CCStation *fromStation;

+ (instancetype)addTrip;

@end
