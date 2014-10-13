//
//  CCAllStationsInterface.h
//  My NS
//
//  Created by Mark Molina on 13/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>


// Defines the public interface that something else can use to drive the user interface
@protocol CCAllStationsInterface <NSObject>

- (void)foundStations;

@end
