//
//  CCAddViewController.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCViewController.h"
#import "CCAddModuleInterface.h"
#import "CCAddViewInterface.h"

@interface CCAddViewController : CCViewController <CCAddViewInterface>

@property (nonatomic, weak) id<CCAddModuleInterface> eventHandler;

@end
