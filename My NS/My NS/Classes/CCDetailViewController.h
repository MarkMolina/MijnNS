//
//  CCDetailViewController.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMultipleTableViewController.h"
#import "CCDetailInterface.h"
#import "CCDetailModuleInterface.h"

@protocol CCDetailModuleInterface;


@interface CCDetailViewController : CCMultipleTableViewController <CCDetailInterface>

@property (nonatomic, weak) id<CCDetailModuleInterface> eventHandler;

@end
