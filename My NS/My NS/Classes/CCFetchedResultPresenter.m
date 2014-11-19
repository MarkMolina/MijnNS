//
//  CCFetchedResultPresenter.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCFetchedResultPresenter.h"
#import "CCManagedObjectStore.h"

@interface CCFetchedResultPresenter (NSFetchedResultsControllerDelegate) <NSFetchedResultsControllerDelegate>
@end

@implementation CCFetchedResultPresenter {
    NSMutableArray *_tableViews;
}

- (void)setFetchedResultsController:(NSFetchedResultsController*)fetchedResultsController
{
    _fetchedResultsController = fetchedResultsController;
    _fetchedResultsController.delegate = self;
    for (UITableView *tableView in _tableViews) {
        [tableView reloadData];
    }
}

- (void)configureCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
}

- (void)addTableView:(UITableView*)tableView
{
    if (!_tableViews) {
        _tableViews = [NSMutableArray new];
    }
    [_tableViews addObject:tableView];
}

@end

@implementation CCFetchedResultPresenter (NSFetchedResultsControllerDelegate)

- (void)controllerWillChangeContent:(NSFetchedResultsController*)controller
{
    for (UITableView *tableView in _tableViews) {
        [tableView beginUpdates];
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController*)controller
{
    for (UITableView *tableView in _tableViews) {
        [tableView endUpdates];
    }
}

- (void)controller:(NSFetchedResultsController*)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath*)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath*)newIndexPath
{
    for (UITableView *tableView in _tableViews) {
        switch (type) {
            case NSFetchedResultsChangeInsert: {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
            }
            case NSFetchedResultsChangeDelete: {
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
            }
            case NSFetchedResultsChangeUpdate: {
                [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
                break;
            }
            case NSFetchedResultsChangeMove: {
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
            }
        }
    }
}

@end

@implementation CCFetchedResultPresenter (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return _fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fetchedResultsController.sections[section] numberOfObjects];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return nil;
}

- (NSArray *)sectionIndexTitlesForTableView: (UITableView *) tableView
{
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

@end
