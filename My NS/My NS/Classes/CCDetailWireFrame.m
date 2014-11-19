//
//  CCDetailWireFrame.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCDetailWireFrame.h"
#import "CCDetailViewController.h"
#import "CCDetailPresenter.h"

static NSString *DetailViewControllerIdentifier = @"CCDetailViewController";

@interface CCDetailWireFrame ()

@property (nonatomic, strong) CCDetailViewController *detailViewController;
@property (nonatomic, strong) UIViewController *presentedViewController;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) NSDictionary *properties;

@end

@implementation CCDetailWireFrame

- (void)pushInterfaceFromNavigationController:(UINavigationController *)navigationController withDict:(NSDictionary *)dict {
    _navigationController = navigationController;
    _properties = dict;
    
    CCDetailViewController *detailViewController = [self getDetailViewControllerFromStoryboard];
    detailViewController.eventHandler = self.detailPresenter;
    detailViewController.delegate = self.detailPresenter;
    
    self.detailPresenter.userInterface = detailViewController;
    
    [_navigationController pushViewController:detailViewController animated:YES];
}

- (void)back {
    [_navigationController popViewControllerAnimated:YES];
}

- (NSDictionary *)tripProperties {
    return _properties;
}

- (CCDetailViewController *)getDetailViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];
    CCDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:DetailViewControllerIdentifier];
    
    return viewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
