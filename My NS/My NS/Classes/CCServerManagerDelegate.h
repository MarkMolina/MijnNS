//
//  CCServerManagerDelegate.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

@protocol CCServerManagerDelegate <NSObject>
@optional

- (void)didFetchTripPossibilities:(NSArray *)array withProperties:(NSDictionary *)properties;

@end