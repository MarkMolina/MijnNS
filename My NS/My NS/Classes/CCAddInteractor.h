//
//  CCAddInteractor.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCAddDataManager;
@class CCStation;

@interface CCAddInteractor : NSObject

- (instancetype)initWithDataManager:(CCAddDataManager *)dataManager;
- (void)addNewTrip;
- (void)setFromStation:(CCStation *)station;
- (void)setViaStation:(CCStation *)station;
- (void)setToStation:(CCStation *)station;
- (void)setDepartureArrival:(NSInteger)index;
- (void)setTravelDate:(NSDate *)date;
- (void)saveTrip;

@end
