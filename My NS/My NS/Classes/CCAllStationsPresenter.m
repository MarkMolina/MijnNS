//
//  CCAllStationsPresenter.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAllStationsPresenter.h"
#import "CCAllStationsWireframe.h"
#import "CCAllStationsTableViewController.h"
#import "CCStation.h"
#import "CCFetchedResultsPresenter+Protected.h"

static NSString *const CCAllStationsTableViewCellIdentifier = @"CCAllStationsTableViewCellIdentifier";

@interface CCAllStationsPresenter (CCAllStationsTableViewControllerDelegate) <CCTableViewControllerDelegate>
@end

@interface CCAllStationsPresenter (UITableViewDelegate) <UITableViewDelegate>
@end

extern NSString * const kStationSelected;

@implementation CCAllStationsPresenter

- (void)updateView {
    [self.allStationsInteractor fetchAllStations];
}

- (void)selectStation {
    
}

- (void)foundAllStations:(NSFetchedResultsController *)fetchedResutlsController {
    [self setFetchedResultsController:fetchedResutlsController];
    [self.userInterface foundStations];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    CCStation *station = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell.textLabel setText:station.longName];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCAllStationsTableViewCellIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

@end

@implementation CCAllStationsPresenter (CCAllStationsTableViewControllerDelegate)

- (void)tableViewControllerDidLoadView:(id<CCTableViewController>)tableViewController
{
    UITableView *tableView = tableViewController.tableView;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:CCAllStationsTableViewCellIdentifier];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setBackgroundColor:UIColor.clearColor];
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    //[tableView setRowHeight:TBOfferCellHeight];
    [self addTableView:tableView];
}

@end

@implementation CCAllStationsPresenter (UITableViewDelegate)

- (NSIndexPath*)tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    CCStation *station = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self.allStationsWireframe back];
    [NSNotificationCenter.defaultCenter postNotificationName:kStationSelected object:station];
    
    return indexPath;
}

@end
