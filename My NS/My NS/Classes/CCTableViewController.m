//
//  CCTableViewController.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTableViewController.h"
#import <UIView+FLKAutoLayout.h>

@interface CCTableViewController ()

@end

@implementation CCTableViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
    [_delegate tableViewControllerDidLoadView:self];
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];
    [_tableView alignToView:self.view];
}

@end
