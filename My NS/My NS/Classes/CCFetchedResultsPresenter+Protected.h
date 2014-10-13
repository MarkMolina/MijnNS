//
//  CCFetchedResultsPresenter+Protected.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCFetchedResultPresenter.h"

@interface CCFetchedResultPresenter (Protected) <UITableViewDataSource>

- (void)addTableView:(UITableView*)tableView;
- (void)configureCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath;

@end
