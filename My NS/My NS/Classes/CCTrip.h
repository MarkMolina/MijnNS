//
//  Trip.h
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCStation;

@interface CCTrip : NSManagedObject

@property (nonatomic, retain) NSNumber * departure;
@property (nonatomic, retain) NSDate * travelDate;
@property (nonatomic, retain) CCStation *to;
@property (nonatomic, retain) CCStation *via;
@property (nonatomic, retain) CCStation *from;

@end
