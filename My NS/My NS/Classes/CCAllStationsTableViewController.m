//
//  CCAllStationsTableViewController.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsTableViewController.h"

@interface CCAllStationsTableViewController ()

@property (nonatomic, strong) UIView *titleView;

@end

@implementation CCAllStationsTableViewController

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

- (void)configureView {
    self.navigationItem.title = @"All Stations";
    // Get ahold of the segmented control that is currently in the title view
    _titleView = [self.navigationItem titleView];
    
    // Create an activity indicator and start it spinning in the nav bar
    UIActivityIndicatorView *aiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.navigationItem setTitleView:aiView];
    [aiView startAnimating];
}

- (void)foundStations {
    self.navigationItem.titleView = _titleView;
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
