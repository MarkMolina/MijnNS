//
//  CCMyTripInteractorIO.h
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCTrip;

@protocol CCMyTripInteractorInput <NSObject>

- (void)fetchMyTrips;
- (void)deleteTrip:(CCTrip *)trip;

@end


@protocol CCMyTripInteractorOutput <NSObject>

- (void)fetchedMyTrips:(NSFetchedResultsController *)fetchedResutlsController;

@end