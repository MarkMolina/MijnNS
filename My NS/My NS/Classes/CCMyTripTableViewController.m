//
//  CCTripTableViewController.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripTableViewController.h"

@interface CCMyTripTableViewController ()

@end

@implementation CCMyTripTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.eventHandler updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CCMyTripInterface

- (void)showTrips {
    
}

#pragma mark - Private Methods

- (void)configureView
{
    self.navigationItem.title = @"My Trips";
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(didTapAddButton:)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)didTapAddButton:(id)sender {
    [self.eventHandler addNewTrip];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
