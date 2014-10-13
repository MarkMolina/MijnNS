//
//  CCAddViewInterface.h
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCAddViewInterface <NSObject>

- (void)setFromStation:(NSString *)stationName;
- (void)setViaStation:(NSString *)stationName;
- (void)setToStation:(NSString *)stationName;

@end

