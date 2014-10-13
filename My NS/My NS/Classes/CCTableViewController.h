//
//  CCTableViewController.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCViewController.h"

@protocol CCTableViewController;

@protocol CCTableViewControllerDelegate <NSObject>

- (void)tableViewControllerDidLoadView:(id<CCTableViewController>)tableViewController;

@end

@protocol CCTableViewController <NSObject>

@property (nonatomic, strong) UITableView *tableView;

@end

@interface CCTableViewController : CCViewController <CCTableViewController>

@property (nonatomic, strong) id<CCTableViewControllerDelegate> delegate;

@end

