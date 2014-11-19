//
//  CCObjectManager.m
//  My NS
//
//  Created by Mark Molina on 14/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCServerManager.h"
#import "CCTripPossibility.h"
#import "CCUtils.h"
#import "CCManagedObject.h"
#import "RKXMLReaderSerialization.h"

@implementation CCServerManager

@synthesize managedObjectStore = _managedObjectStore;

static NSString *const possibilitiesPath = @"/ns-api-treinplanner";

- (id)init {
    self = [super init];
    if (self) {
        return self;
    }
    return self;
}

/*- (void)setDelegate:(id<CCServerManagerDelegate>)delegate
{
    if (delegate == self.delegate) {
        return;
    }
    
    [[RKObjectManager sharedManager].operationQueue cancelAllOperations];
    self.delegate = delegate;
}*/

#pragma mark - Class Methods

+ (CCServerManager *)sharedInstance {
    static CCServerManager *instance = nil;
    if (!instance) {
        instance = [[CCServerManager alloc] init];
    }
    return instance;
}

#pragma mark - Private Methods

- (void)configObjectManager {
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:(RKManagedObjectStore*)self.managedObjectStore];
    
    // Configure the object manager
    RKObjectManager *objectmanager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://webservices.ns.nl"]];
    objectmanager.managedObjectStore = (RKManagedObjectStore*)self.managedObjectStore;
    [objectmanager setRequestSerializationMIMEType:RKMIMETypeTextXML];
    
    
    [objectmanager.HTTPClient setAuthorizationHeaderWithUsername:@"Mark@clevercode.nl" password:@"SUm9_t_wA6JY38R2sV4xF_1ljiw9acc60CXLXvn4idQSgNpqZ2qyDw"];
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"text/xml"];
    
    [RKObjectManager setSharedManager:objectmanager];
}

- (void)setupApiForModel:(Class) model andPath:(NSString*) apiPath andObjectManager:(RKObjectManager*)rkObjectManager
{
    if (![model isSubclassOfClass:[CCManagedObject class]]) {
        return;
    }
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[model mappingForManagedObjectStore:(RKManagedObjectStore*)self.managedObjectStore] method:RKRequestMethodAny pathPattern:apiPath keyPath:@"ReisMogelijkheden.ReisMogelijkheid" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [rkObjectManager addResponseDescriptor:responseDescriptor];
}

- (void)fetchTripPossibilitesFrom:(NSString *)from To:(NSString *)to when:(NSString *)date {
    
    NSString *apiPath = possibilitiesPath;
    NSString *queryPath = [self composePathForGET:apiPath withParams:
                           @{@"fromStation": from,
                             @"toStation": to,
                             @"previousAdvices": @"2",
                             @"nextAdvices": @"2",
                             //@"dateTime": @"2014-10-13T17:50"
                             @"dateTime" : date}];
    
    RKObjectManager *rkObjectManager = [RKObjectManager sharedManager];
    
    [self setupApiForModel:[CCTripPossibility class] andPath:apiPath andObjectManager:rkObjectManager];
    
    [rkObjectManager getObjectsAtPath:queryPath
                           parameters:nil
                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                  NSUInteger statusCode = operation.HTTPRequestOperation.response.statusCode;
                                  if (self.delegate && [self.delegate respondsToSelector:@selector(didFetchTripPossibilities:withProperties:)]) {
                                      if (statusCode == 204) {
                                          NSLog(@"Authentication Failed. Status 204 (NO_CONTENT) returned.");
                                      }
                                      
                                      NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:date, @"travelDate", [NSNumber numberWithBool:YES], @"departure", from, @"from", to, @"to", nil];
                                      
                                      [self.delegate didFetchTripPossibilities:mappingResult.array withProperties:dict];
                                  }
                              }
                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                  
                                  NSLog(@"Error at completion: %@", error.localizedDescription);
                                  
                                  /*if (self.delegate && [self.delegate respondsToSelector:@selector(didReceiveError:)]) {
                                      [self.delegate didReceiveError:error.debugDescription];
                                  }*/
                              }];
}

- (NSString*)composePathForGET:(NSString*)path withParams:(NSDictionary*)params
{
    return [self composePath:path andRequestMethod:RKRequestMethodGET withParams:params];
}

- (NSString*)composePath:(NSString*)path andRequestMethod:(NSInteger)requestMethod withParams:(NSDictionary*)params
{
    return [path stringByAppendingString:[CCUtils dictionaryToString:params prependedWith:@"?"]];
}

@end
