//
//  CCModuleInteractor.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCInteractor;
@class CCManagedObjectStore;

@protocol CCModuleInteractor <NSObject>

//@property (nonatomic, strong) id<CCInteractor> applicationInteractor;
@property (nonatomic, strong) CCManagedObjectStore *managedObjectStore;

//- (void)presentMainViewControllerInNavigationController:(UINavigationController*)navigationController append:(BOOL)append animated:(BOOL)animated;

@end