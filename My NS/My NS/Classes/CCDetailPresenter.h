//
//  CCDetailPresenter.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCDetailInteractorIO.h"
#import "CCDetailModuleInterface.h"
#import "CCFetchedResultPresenter.h"

@class CCDetailWireFrame;

@protocol CCDetailInteractorInput;
@protocol CCDetailInterface;

@interface CCDetailPresenter : NSObject <CCDetailInteractorOutput, CCDetailModuleInterface>

@property (nonatomic, strong) id<CCDetailInteractorInput> detailInteractor;
@property (nonatomic, strong) CCDetailWireFrame *detailWireFrame;

@property (nonatomic, strong) UIViewController<CCDetailInterface> *userInterface;

@end
