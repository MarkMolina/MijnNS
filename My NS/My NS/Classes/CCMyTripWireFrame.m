//
//  CCMyTripWireFrame.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripWireFrame.h"

#import "CCMyTripTableViewController.h"
#import "CCMyTripPresenter.h"
#import "CCRootWireFrame.h"
#import "CCAddWireFrame.h"
#import "CCDetailViewController.h"
#import "CCDetailWireFrame.h"

static NSString *MyTripTableViewControllerIdentifier = @"CCMyTripTableViewController";

@interface CCMyTripWireFrame ()

@property (nonatomic, strong) CCMyTripTableViewController *myTripTableViewController;

@end

@implementation CCMyTripWireFrame

- (void)presentMyTripInterfaceFromWindow:(id)window {
    CCMyTripTableViewController *myTripTableViewController = [self myTripTableViewControllerFromStoryboard];
    myTripTableViewController.eventHandler = self.myTripPresenter;
    myTripTableViewController.delegate = self.myTripPresenter;
    
    self.myTripPresenter.userInterface = myTripTableViewController;
    self.myTripTableViewController = myTripTableViewController;
    
    [self.rootWireframe showRootViewController:myTripTableViewController inWindow:window];
}

- (void)presentAddInterface {
    [self.addWireframe presentAddInterfaceFromViewController:self.myTripTableViewController];
}

- (void)pushDetailInterfaceWithTripProperties:(NSDictionary *)dict {
    [self.detailWireFrame pushInterfaceFromNavigationController:self.myTripTableViewController.navigationController withDict:dict];
}

- (CCMyTripTableViewController *)myTripTableViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    CCMyTripTableViewController *tableViewController = [storyboard instantiateViewControllerWithIdentifier:MyTripTableViewControllerIdentifier];
    
    return tableViewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
