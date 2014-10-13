//
//  CCAllStationsInteractor.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsInteractorIO.h"

@class CCAllStationsDataManager;

@interface CCAllStationsInteractor : NSObject <CCAllStationsInteractorInput>

@property (nonatomic, weak)     id<CCAllStationsInteractorOutput> output;

- (instancetype)initWithDataManager:(CCAllStationsDataManager *)dataManager;

@end
