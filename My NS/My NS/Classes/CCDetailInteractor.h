//
//  CCDetailInteractor.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCDetailInteractorIO.h"
#import "CCServerManagerDelegate.h"

@class CCDetailDataManager;

@interface CCDetailInteractor : NSObject <CCDetailInteractorInput, CCServerManagerDelegate>

@property (nonatomic, weak)     id<CCDetailInteractorOutput> output;

- (instancetype)initWithDataManager:(CCDetailDataManager *)dataManager;

@end
