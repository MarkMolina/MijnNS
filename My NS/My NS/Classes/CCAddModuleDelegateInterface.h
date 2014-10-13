//
//  CCAddModuleDelegateInterface.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

// This protocol becomes the way by which something else can hear back about what happened inside of this module
@protocol CCAddModuleDelegate <NSObject>

- (void)addModuleDidCancelAddAction;
- (void)addModuleDidSaveAddAction;

@end
