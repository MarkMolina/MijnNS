//
//  CCDetailPresenter.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCDetailPresenter.h"
#import "CCDetailWireFrame.h"
#import "CCDetailViewController.h"
#import "CCDetailInterface.h"
//#import "CCFetchedResultsPresenter+Protected.h"

static CGFloat const CCDetailCellHeight = 107.0f;
static NSString *const CCDetailViewCellIdentifier = @"CCMyTripsTableViewCellIdentifier";

@interface CCDetailPresenter (CCDetailViewControllerDelegate) <CCMultipleTableViewControllerDelegate>
@end

@interface CCDetailPresenter (UITableViewDelegate) <UITableViewDelegate>
@end

@interface CCDetailPresenter (UITableViewDataSource) <UITableViewDataSource>

@end

@interface CCDetailPresenter()

@property (nonatomic, strong) NSSet *possiblities;
@property (nonatomic, strong) NSArray *tableViewArrays;

@end

@implementation CCDetailPresenter

- (void)updateView {
    [self calculatePossibilies];
}

- (void)calculatePossibilies {
    [self.detailInteractor calculatePossibilies:[self.detailWireFrame tripProperties]];
}

- (void)didCalculatePossibilites:(NSSet *)possibilities {
    self.possiblities = possibilities;
    [self.userInterface setTableViews:[self.possiblities count]];
}

@end

@implementation CCDetailPresenter (UITableViewDelegate)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected row");
}

@end

@implementation CCDetailPresenter (UITableViewDataSource)

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Lorem ipsum dolor sit";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Count: %ld", [self.tableViewArrays count]);
    return [self.tableViewArrays count];
}

@end

@implementation CCDetailPresenter (CCDetailViewControllerDelegate)

- (void)tableViewControllerDidLoadView:(id<CCMultipleTableViewController>)multipleTableViewController {
    
    self.tableViewArrays = multipleTableViewController.tableViewsArray;
    
    for (UITableView *tableView in self.tableViewArrays) {
        //[tableView registerClass:CCMyTripTableViewCell.class forCellReuseIdentifier:CCMyTripsTableViewCellIdentifier];
        [tableView setDataSource:self];
        [tableView setDelegate:self];
        //[tableView setBackgroundColor:UIColor.clearColor];
        //[tableView setSeparatorInset:UIEdgeInsetsZero];
        [tableView setRowHeight:CCDetailCellHeight];
        //[self addTableView:tableView];
        
        //UINib *nib = [UINib nibWithNibName:@"CCMyTripTableViewCell" bundle:nil];
        // Register this NIB which contains the cell
        //[tableView registerNib:nib forCellReuseIdentifier:CCMyTripsTableViewCellIdentifier];
    }
}

@end
