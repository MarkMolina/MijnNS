//
//  CCMultipleTableViewController.m
//  My NS
//
//  Created by Mark Molina on 17/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMultipleTableViewController.h"
#import <UIView+FLKAutoLayout.h>

@implementation CCMultipleTableViewController

@synthesize tableViewsArray = _tableViewsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setupTableViews:(NSInteger)amount
{
    _tableViewsArray = [[NSMutableArray alloc] initWithCapacity:amount];
    
    for (int i = 0; i<amount; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:tableView];
        
        [_tableViewsArray addObject:tableView];
    }
    
    // align the first label with its superview
    [_tableViewsArray[0] alignTop:@"20" leading:@"0" toView:((UITableView *)_tableViewsArray[0]).superview];
    
    // give it a minimum width of 320 and a maximum width of the view
    [_tableViewsArray[0] constrainWidth:[NSString stringWithFormat:@"<=%f", self.view.frame.size.width]];
    
    // now constrain all labels to this size
    [UIView alignLeadingAndTrailingEdgesOfViews:_tableViewsArray];
    
    // space the labels out vertically with 10 points in between
    [UIView spaceOutViewsVertically:_tableViewsArray predicate:@"10"];
    
    
    [_delegate tableViewControllerDidLoadView:self];
}

@end
