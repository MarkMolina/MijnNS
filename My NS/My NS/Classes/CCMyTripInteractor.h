//
//  CCMyTripInteractor.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMyTripInteractorIO.h"
#import "CCServerManagerDelegate.h"

@class CCMyTripDataManager;
@class CCTrip;

@interface CCMyTripInteractor : NSObject <CCMyTripInteractorInput, CCServerManagerDelegate>

//@property (nonatomic, strong) CCTrip *selectedTrip;
@property (nonatomic, weak)     id<CCMyTripInteractorOutput> output;

- (instancetype)initWithDataManager:(CCMyTripDataManager *)dataManager;

@end
