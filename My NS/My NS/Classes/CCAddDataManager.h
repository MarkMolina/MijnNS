//
//  CCAddDataManager.h
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCModuleInteractor.h"

@class CCTripModel;

@interface CCAddDataManager : NSObject <CCModuleInteractor>

- (void)addNewTrip:(CCTripModel *)trip;

@end
