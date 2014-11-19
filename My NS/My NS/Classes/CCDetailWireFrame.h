//
//  CCDetailWireFrame.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

@class CCDetailPresenter;

#import <Foundation/Foundation.h>

@interface CCDetailWireFrame : NSObject

@property (nonatomic, strong) CCDetailPresenter *detailPresenter;

- (void)pushInterfaceFromNavigationController:(UINavigationController *)navigationController withDict:(NSDictionary *)dict;
- (NSDictionary *)tripProperties;

@end
