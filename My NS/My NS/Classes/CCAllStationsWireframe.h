//
//  CCAllStationsWireframe.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCAllStationsPresenter;
@class CCAllStationsTableViewController;

@interface CCAllStationsWireframe : NSObject

@property (nonatomic, strong) CCAllStationsPresenter *allStationsPresenter;

- (void)pushAllStationsInterfaceFromNavigationController:(UINavigationController *)navigationController;
- (void)presentAllStationsInterfaceFromViewController:(UIViewController *)viewController;
- (void)back;
- (CCAllStationsTableViewController *)allStationsTableViewController;

@end
