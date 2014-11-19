//
//  CCAllStationsWireframe.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsWireframe.h"
#import "CCAllStationsTableViewController.h"
#import "CCAllStationsPresenter.h"

static NSString *AddViewControllerIdentifier = @"CCAllStationsTableViewController";

@interface CCAllStationsWireframe ()

@property (nonatomic, strong) UIViewController *presentedViewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation CCAllStationsWireframe

- (void)pushAllStationsInterfaceFromNavigationController:(UINavigationController *)navigationController {\
    _navigationController = navigationController;
    
    CCAllStationsTableViewController *allStationTableViewController = [self allStationsTableViewController];
    allStationTableViewController.eventHandler = self.allStationsPresenter;
    allStationTableViewController.delegate = self.allStationsPresenter;

    self.allStationsPresenter.userInterface = allStationTableViewController;
    
    [_navigationController pushViewController:allStationTableViewController animated:YES];
}

- (void)presentAllStationsInterfaceFromViewController:(UIViewController *)viewController
{
    CCAllStationsTableViewController *allStationTableViewController = [self allStationsTableViewController];
    allStationTableViewController.eventHandler = self.allStationsPresenter;
    
    [viewController presentViewController:allStationTableViewController animated:YES completion:nil];
    
    self.presentedViewController = viewController;
}

- (void)back {
    [_navigationController popViewControllerAnimated:YES];
}

- (CCAllStationsTableViewController *)allStationsTableViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    CCAllStationsTableViewController *allStationTableViewController = [storyboard instantiateViewControllerWithIdentifier:AddViewControllerIdentifier];
    
    return allStationTableViewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
