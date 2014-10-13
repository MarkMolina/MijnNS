//
//  CCAddPresenter.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAddPresenter.h"
#import "CCAddWireFrame.h"
#import "CCAddInteractor.h"
#import "CCStation.h"

NSString * const kStationSelected           = @"StationSelected";

@interface CCAddPresenter()

@property (nonatomic) NSInteger index;

@end

@implementation CCAddPresenter

#pragma mark - CCAddModuleInterface

- (void)cancel {
    [self.addWireframe dismissAddInterface];
    [self.addModuleDelegate addModuleDidCancelAddAction];
}

- (void)showStationsFromIndex:(NSInteger)index {
    _index = index;
    [self.addWireframe pushAllStationsInterface];
}

- (void)configureUserInterfaceForPresentation {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(stationSelected:) name:kStationSelected object:nil];
    [self.addInteractor addNewTrip];
}

- (void)stationSelected:(NSNotification*)notification {
    CCStation *station = notification.object;
    
    switch (_index) {
        case 0:
            [self.addInteractor setFromStation:station];
            [self.addViewInterface setFromStation:station.longName];
            break;
        case 1:
            [self.addInteractor setViaStation:station];
            [self.addViewInterface setViaStation:station.longName];
            break;
        case 2:
            [self.addInteractor setToStation:station];
            [self.addViewInterface setToStation:station.longName];
            break;
            
        default:
            break;
    }
}

- (void)saveAddActionWithDate:(NSDate *)date andSegmentedIndex:(NSInteger)index {
    [self.addInteractor setDepartureArrival:index];
    [self.addInteractor setTravelDate:date];
    
    [self.addInteractor saveTrip];
    
    [self.addWireframe dismissAddInterface];
}

@end
