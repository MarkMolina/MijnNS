//
//  CCMyTripPresenter.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMyTripInteractorIO.h"
#import "CCMyTripModuleInterface.h"
#import "CCAddModuleDelegateInterface.h"
#import "CCFetchedResultPresenter.h"

@class CCMyTripWireFrame;

@protocol CCMyTripInterface;

@interface CCMyTripPresenter : CCFetchedResultPresenter <CCMyTripInteractorOutput, CCMyTripModuleInterface, CCAddModuleDelegate>

@property (nonatomic, strong) id<CCMyTripInteractorInput> myTripInteractor;
@property (nonatomic, strong) CCMyTripWireFrame *myTripWireFrame;

@property (nonatomic, strong) UIViewController<CCMyTripInterface> *userInterface;

@end
