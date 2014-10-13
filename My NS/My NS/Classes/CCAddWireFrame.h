//
//  CCAddWireFrame.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCAddPresenter;
@class CCAllStationsWireframe;

@interface CCAddWireFrame : NSObject

@property (nonatomic, strong) CCAddPresenter *addPresenter;
@property (nonatomic, strong) CCAllStationsWireframe *allStationsWireframe;

- (void)presentAddInterfaceFromViewController:(UIViewController *)viewController;
- (void)pushAllStationsInterface;
- (void)dismissAddInterface;

@end
