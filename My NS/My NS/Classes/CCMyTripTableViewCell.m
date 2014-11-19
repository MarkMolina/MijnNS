//
//  CCMyTripTableViewCell.m
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCMyTripTableViewCell.h"

@implementation CCMyTripTableViewCell

- (void)isLoading:(BOOL)loaded {
    if (loaded) {
        _activityIndicatorContainer.hidden = YES;
    } else {
        _activityIndicatorContainer.hidden = NO;
    }
}

@end
