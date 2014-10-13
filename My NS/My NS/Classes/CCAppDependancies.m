//
//  CCAppDependancies.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAppDependancies.h"
#import "CCManagedObjectStore.h"
#import "CCRootWireFrame.h"

#import "CCMyTripDataManager.h"
#import "CCMyTripInteractor.h"
#import "CCMyTripPresenter.h"
#import "CCMyTripWireFrame.h"

#import "CCAddDataManager.h"
#import "CCAddInteractor.h"
#import "CCAddPresenter.h"
#import "CCAddWireFrame.h"

#import "CCAllStationsDataManager.h"
#import "CCAllStationsInteractor.h"
#import "CCAllStationsPresenter.h"
#import "CCAllStationsWireframe.h"

@interface CCAppDependancies ()

@property (nonatomic, strong) CCMyTripWireFrame *myTripWireframe;
@property (nonatomic, strong) CCManagedObjectStore *managedObjectStore;

@end

@implementation CCAppDependancies

@synthesize managedObjectStore = _managedObjectStore;

- (id)init {
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}


- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self.myTripWireframe presentMyTripInterfaceFromWindow:window];
}


- (void)configureDependencies {
    CCManagedObjectStore *dataStore = [CCManagedObjectStore new];
    
    CCRootWireFrame *rootWireFrame = [CCRootWireFrame new];
    
    // My Trip Module
    CCMyTripDataManager *myTripDataManager = [CCMyTripDataManager new];
    CCMyTripInteractor *myTripInteractor = [[CCMyTripInteractor alloc] initWithDataManager:myTripDataManager];
    CCMyTripPresenter *myTripPresenter = [CCMyTripPresenter new];
    CCMyTripWireFrame *myTripWireFrame = [CCMyTripWireFrame new];
    
    // Add Module
    CCAddDataManager *addDataManager = [CCAddDataManager new];
    CCAddInteractor *addInteractor = [[CCAddInteractor alloc] initWithDataManager:addDataManager];
    CCAddPresenter *addPresenter = [CCAddPresenter new];
    CCAddWireFrame *addWireframe = [CCAddWireFrame new];
    
    
    // All Stations
    CCAllStationsDataManager *allStationsDataManager = [CCAllStationsDataManager new];
    CCAllStationsInteractor *allStationsInteractor = [[CCAllStationsInteractor alloc] initWithDataManager:allStationsDataManager];
    CCAllStationsPresenter *allStationsPresenter = [CCAllStationsPresenter new];
    CCAllStationsWireframe *allstationsWireframe = [CCAllStationsWireframe new];
    
    // My Trip
    myTripInteractor.output = myTripPresenter;
    
    myTripPresenter.myTripInteractor = myTripInteractor;
    myTripPresenter.myTripWireFrame = myTripWireFrame;
    
    myTripWireFrame.addWireframe = addWireframe;
    myTripWireFrame.myTripPresenter = myTripPresenter;
    myTripWireFrame.rootWireframe = rootWireFrame;
    
    myTripDataManager.managedObjectStore = dataStore;
    self.myTripWireframe = myTripWireFrame;
    
    // Add
    //addInteractor.output
    
    addPresenter.addInteractor = addInteractor;
    addPresenter.addWireframe = addWireframe;
    
    addWireframe.allStationsWireframe = allstationsWireframe;
    addWireframe.addPresenter = addPresenter;
    
    addDataManager.managedObjectStore = dataStore;
    
    // All Stations
    allStationsInteractor.output = allStationsPresenter;
    
    allStationsPresenter.allStationsInteractor = allStationsInteractor;
    allStationsPresenter.allStationsWireframe = allstationsWireframe;

    allstationsWireframe.allStationsPresenter = allStationsPresenter;
                                                        
    allStationsDataManager.managedObjectStore = dataStore;
    
    
}

@end
