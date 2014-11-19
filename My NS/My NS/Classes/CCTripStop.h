//
//  CCTripStop.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObject.h"

@class CCTripPart;

@interface CCTripStop : CCManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * track;
@property (nonatomic, retain) CCTripPart *part;
@end

@interface CCTripStop (CoreDataGeneratedAccessors)

//- (void)addPartsObject:(NSManagedObject *)value;
//- (void)removePartsObject:(NSManagedObject *)value;
- (void)addParts:(NSSet *)values;
- (void)removeParts:(NSSet *)values;

@end
