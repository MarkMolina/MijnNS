//
//  CCAllStationsInteractor.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsInteractor.h"
#import "CCAllStationsDataManager.h"

@interface CCAllStationsInteractor()

@property (nonatomic, strong)   CCAllStationsDataManager *dataManager;

@end

@implementation CCAllStationsInteractor

- (instancetype)initWithDataManager:(CCAllStationsDataManager *)dataManager
{
    if ((self = [super init]))
    {
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)fetchAllStations {
    __weak typeof(self) welf = self;
    
    [self.dataManager createFetchedResultsControllerWithCompletion:^(NSFetchedResultsController *fetchedResultController) {
        [welf.output foundAllStations:fetchedResultController];
    }];
}


@end
