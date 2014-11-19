//
//  CCDetailDataManager.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCModuleInteractor.h"

@class CCStation;

@interface CCDetailDataManager : NSObject <CCModuleInteractor>

- (void)tripWithFrom:(CCStation *)from to:(CCStation *)to when:(NSDate *)travelDate completionBlock:(void (^)(NSArray *possibilities))completionBlock;

@end
