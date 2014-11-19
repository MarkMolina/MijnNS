//
//  CCObjectManager.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCModuleInteractor.h"
#import "CCServerManagerDelegate.h"

@interface CCServerManager : NSObject <CCModuleInteractor>

@property (nonatomic, weak) id<CCServerManagerDelegate> delegate;

+ (CCServerManager *)sharedInstance;
- (void)configObjectManager;
- (void)fetchTripPossibilitesFrom:(NSString *)from To:(NSString *)to when:(NSString *)date;
    
@end
