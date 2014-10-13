//
//  CCAllStationsTableViewController.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCTableViewController.h"
#import "CCAllStationsModuleInterface.h"
#import "CCAllStationsInterface.h"

@interface CCAllStationsTableViewController : CCTableViewController <CCAllStationsInterface>

@property (nonatomic, weak) id<CCAllStationsModuleInterface> eventHandler;

@end
