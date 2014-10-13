//
//  CCMyTripWireFrame.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCMyTripPresenter;
@class CCRootWireFrame;
@class CCAddWireFrame;

@interface CCMyTripWireFrame : NSObject

@property (nonatomic, strong) CCAddWireFrame *addWireframe;
@property (nonatomic, strong) CCMyTripPresenter *myTripPresenter;
@property (nonatomic, strong) CCRootWireFrame *rootWireframe;

- (void)presentMyTripInterfaceFromWindow:(UIWindow *)window;
- (void)presentAddInterface;

@end
