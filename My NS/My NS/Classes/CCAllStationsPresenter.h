//
//  CCAllStationsPresenter.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCAllStationsModuleInterface.h"
#import "CCAllStationsInteractorIO.h"
#import "CCFetchedResultPresenter.h"

@class CCAllStationsWireframe;

@protocol CCAllStationsInterface;

@interface CCAllStationsPresenter : CCFetchedResultPresenter <CCAllStationsModuleInterface, CCAllStationsInteractorOutput>

@property (nonatomic, strong) id<CCAllStationsInteractorInput> allStationsInteractor;
@property (nonatomic, strong) CCAllStationsWireframe *allStationsWireframe;

@property (nonatomic, strong) UIViewController<CCAllStationsInterface> *userInterface;

@end
