//
//  CCAllStationsInteractorIO.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CCAllStationsInteractorInput <NSObject>
- (void)fetchAllStations;
@end


@protocol CCAllStationsInteractorOutput <NSObject>

- (void)foundAllStations:(NSFetchedResultsController *)fetchedResutlsController;

@end
