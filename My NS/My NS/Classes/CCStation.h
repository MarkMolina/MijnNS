//
//  CCStation.h
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//


#import "CCManagedObject.h"

@interface CCStation : CCManagedObject

@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * uicode;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * longName;
@property (nonatomic, retain) NSString * mediumName;
@property (nonatomic, retain) NSString * shortName;

@end
