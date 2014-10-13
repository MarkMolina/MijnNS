//
//  CCAddPresenter.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCAddModuleInterface.h"
#import "CCAddModuleDelegateInterface.h"
#import "CCAddViewInterface.h"

@class CCAddWireFrame;
@class CCAddInteractor;

@interface CCAddPresenter : NSObject <CCAddModuleInterface>

@property (nonatomic, strong) CCAddInteractor *addInteractor;
@property (nonatomic, weak) id<CCAddModuleDelegate> addModuleDelegate;
@property (nonatomic, weak) id<CCAddViewInterface> addViewInterface;
@property (nonatomic, strong) CCAddWireFrame *addWireframe;


- (void)configureUserInterfaceForPresentation;

@end
