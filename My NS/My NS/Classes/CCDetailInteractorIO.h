//
//  CCDetailInteractorIO.h
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCDetailInteractorInput <NSObject>

- (void)calculatePossibilies:(NSDictionary *)dict;

@end


@protocol CCDetailInteractorOutput<NSObject>

- (void)didCalculatePossibilites:(NSSet *)possibilities;

@end