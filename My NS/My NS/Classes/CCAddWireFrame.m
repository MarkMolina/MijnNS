//
//  CCAddWireFrame.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAddWireFrame.h"
#import "CCAddViewController.h"
#import "CCAllStationsWireframe.h"
#import "CCAddViewController.h"
#import "CCAddPresenter.h"

static NSString *AddViewControllerIdentifier = @"CCAddViewController";

@interface CCAddWireFrame ()

@property (nonatomic, strong) CCAddViewController *addViewController;;
@property (nonatomic, strong) UIViewController *presentedViewController;

@end

@implementation CCAddWireFrame

- (void)presentAddInterfaceFromViewController:(UIViewController *)viewController
{
    CCAddViewController *addViewController = [self getAddViewController];
    addViewController.eventHandler = self.addPresenter;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addViewController];
    
    //[self.addPresenter configureUserInterfaceForPresentation:addViewController];
    self.addPresenter.addViewInterface = addViewController;
    [self.addPresenter configureUserInterfaceForPresentation];
    
    [viewController presentViewController:navController animated:YES completion:nil];
    
    self.addViewController = addViewController;
    self.presentedViewController = viewController;
}

- (void)dismissAddInterface
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)pushAllStationsInterface {
    [self.allStationsWireframe pushAllStationsInterfaceFromNavigationController:self.addViewController.navigationController];
}

- (CCAddViewController *)getAddViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    CCAddViewController *addViewController = [storyboard instantiateViewControllerWithIdentifier:AddViewControllerIdentifier];
    
    return addViewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
