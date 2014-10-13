//
//  CCAddModuleInterface.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

@protocol CCAddModuleInterface <NSObject>

- (void)cancel;
- (void)showStationsFromIndex:(NSInteger)index;
- (void)saveAddActionWithDate:(NSDate *)date andSegmentedIndex:(NSInteger)index;

@end