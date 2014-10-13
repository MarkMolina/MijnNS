//
//  CCMyTripPresenter.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripPresenter.h"
#import "CCMyTripWireFrame.h"
#import "CCMyTripTableViewController.h"
#import "CCFetchedResultsPresenter+Protected.h"
#import "CCTrip.h"
#import "CCStation.h"
#import "CCMyTripInteractor.h"
#import "CCMyTripTableViewCell.h"

static CGFloat const CCMyTripCellHeight = 107.0f;
static NSString *const CCMyTripsTableViewCellIdentifier = @"CCMyTripsTableViewCellIdentifier";

@interface CCMyTripPresenter (CCMyTripsTableViewControllerDelegate) <CCTableViewControllerDelegate>
@end

@interface CCMyTripPresenter (UITableViewDelegate) <UITableViewDelegate>
@end

@implementation CCMyTripPresenter

- (void)updateView {
    [self.myTripInteractor fetchMyTrips];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    CCTrip *trip = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [((CCMyTripTableViewCell*)cell).fromLabel setText:trip.from.longName];
    [((CCMyTripTableViewCell*)cell).viaLabel setText:trip.via.longName];
    [((CCMyTripTableViewCell*)cell).toLabel setText:trip.to.longName];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CCMyTripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCMyTripsTableViewCellIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - CCMyTripInteractorInput

- (void)fetchedMyTrips:(NSFetchedResultsController *)fetchedResutlsController {
    [self setFetchedResultsController:fetchedResutlsController];
}

#pragma mark - CCMyTripModuleInterface

- (void)addNewTrip {
    [self.myTripWireFrame presentAddInterface];
}

#pragma mark - CCAddModuleDelegateInterface

- (void)addModuleDidCancelAddAction {
    
}

- (void)addModuleDidSaveAddAction {
    
}

@end

@implementation CCMyTripPresenter (CCMyTripsTableViewControllerDelegate)

- (void)tableViewControllerDidLoadView:(id<CCTableViewController>)tableViewController
{
    
    UITableView *tableView = tableViewController.tableView;
    [tableView registerClass:CCMyTripTableViewCell.class forCellReuseIdentifier:CCMyTripsTableViewCellIdentifier];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setBackgroundColor:UIColor.clearColor];
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    [tableView setRowHeight:CCMyTripCellHeight];
    [self addTableView:tableView];
    
    UINib *nib = [UINib nibWithNibName:@"CCMyTripTableViewCell" bundle:nil];
    // Register this NIB which contains the cell
    [tableView registerNib:nib forCellReuseIdentifier:CCMyTripsTableViewCellIdentifier];
}

@end

@implementation CCMyTripPresenter (UITableViewDelegate)

- (NSIndexPath*)tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    return indexPath;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    CCTrip *trip = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self.myTripInteractor deleteTrip:trip];
}

@end

