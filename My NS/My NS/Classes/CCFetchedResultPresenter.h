//
//  CCFetchedResultPresenter.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CCFetchedResultsPresenter;
@class NSFetchedResultsController;

@protocol CCFetchedResultsPresenter
@end

@protocol CCFetchedResultsPresenterDelegate <NSObject>

- (void)fetchedResultsPresenter:(id<CCFetchedResultsPresenter>)fetchedResultsPresenter willSelectItemWithId:(NSUInteger)offerId;

@end

@interface CCFetchedResultPresenter : NSObject <CCFetchedResultsPresenter>

@property (nonatomic, strong) id<CCFetchedResultsPresenterDelegate> delegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
