//
//  CCMultipleTableViewController.h
//  My NS
//
//  Created by Mark Molina on 17/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCViewController.h"

@protocol CCMultipleTableViewController;

@protocol CCMultipleTableViewControllerDelegate <NSObject>

- (void)tableViewControllerDidLoadView:(id<CCMultipleTableViewController>)multipleTableViewController;

@end

@protocol CCMultipleTableViewController <NSObject>

@property (nonatomic, strong) NSMutableArray *tableViewsArray;

@end

@interface CCMultipleTableViewController : CCViewController <CCMultipleTableViewController>

@property (nonatomic, strong) id<CCMultipleTableViewControllerDelegate> delegate;

- (void)setupTableViews:(NSInteger)amount;

@end
