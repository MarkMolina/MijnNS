//
//  CCManagedObjectStore.m
//  My NS
//
//  Created by Mark Molina on 12/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCManagedObjectStore.h"
#import <RestKit/RestKit.h>
#import "CCStation.h"
#import "RKXMLReaderSerialization.h"
#import "CCTrip.h"

static NSManagedObjectModel *__sharedManagedObjectModel;
static CCManagedObjectStore *__sharedInstance;

@implementation CCManagedObjectStore {
    NSManagedObjectContext *_outsideManagedObjectContext;
}

+ (instancetype)sharedInstance
{
    @synchronized(self) {
        __sharedInstance = [[self alloc] initWithManagedObjectModel:self.sharedManagedObjectModel];
    }
    return __sharedInstance;
}

+ (void)setSharedManagedObjectModel:(NSManagedObjectModel*)sharedObjectModel
{
    NSAssert(!__sharedInstance, @"Call %s before accessing the sharedInstance", __PRETTY_FUNCTION__);
    // this function will probably be used by tests to be able to pass a mock managed object model
    __sharedManagedObjectModel = sharedObjectModel;
}

+ (NSManagedObjectModel*)sharedManagedObjectModel
{
    if (!__sharedManagedObjectModel) {
        // return default most likely used managed object model
        __sharedManagedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    return __sharedManagedObjectModel;
}

+ (NSString*)dataStoreName
{
    return @"NS-API-AllStations";
}

+ (NSString*)seedDataStoreName
{
    return @"NS-API-AllStations";
}

+ (NSString*)dataStoreExtension
{
    return @"db";
}

+ (NSString*)seedDataStoreExtension
{
    return @"sdb";
}

+ (void)createSeedDataStore
{
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelInfo);
    RKLogConfigureByName("RestKit/CoreData", RKLogLevelTrace);
    
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"application/xml"];
    
    NSString *root = RKApplicationDataDirectory();
    RKEnsureDirectoryExistsAtPath(root, nil);
    NSString *seedStorePath = [root stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", CCManagedObjectStore.seedDataStoreName, CCManagedObjectStore.seedDataStoreExtension]];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:self.class.sharedManagedObjectModel];
    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:self.class.sharedManagedObjectModel storePath:seedStorePath];

    NSString *stationsXMLPath = [NSBundle.mainBundle pathForResource:@"data" ofType:@"xml" inDirectory:nil];
    
    NSLog(@"Create seed data store for all stations : NS-API-AllStations");
    NSLog(@"Seed data store path : %@", seedStorePath);
    NSLog(@"Import stations from file : %@", stationsXMLPath);
    
    [importer importObjectsFromItemAtPath:stationsXMLPath
                              withMapping:[CCStation mappingForManagedObjectStore:managedObjectStore]
                                  keyPath:@"Stations.Station"
                                    error:nil];
    
    NSError *error;
    if (![importer finishImporting:&error]) {
        NSLog(@"Failed to finish import and save seed database due to error: %@", error);
        return;
    }
    
    [importer logSeedingInfo];
    
    importer = nil;
}

- (instancetype)initWithManagedObjectModel:(NSManagedObjectModel*)managedObjectModel
{
    self = [super initWithManagedObjectModel:managedObjectModel];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    if (self.persistentStoreManagedObjectContext)
        return;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *homePath = paths.firstObject;
    NSString *databasePath = [homePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", self.class.dataStoreName, self.class.dataStoreExtension]];
    NSString *seedDatabasePath = [NSBundle.mainBundle pathForResource:self.class.seedDataStoreName ofType:self.class.seedDataStoreExtension inDirectory:@"Seeds"];
    NSDictionary *options = @{NSInferMappingModelAutomaticallyOption: @YES, NSMigratePersistentStoresAutomaticallyOption: @YES, NSSQLitePragmasOption : @{ @"journal_mode" : @"DELETE" }};
    NSError *error;
    
    NSPersistentStore *persistentStore = [self addSQLitePersistentStoreAtPath:databasePath
                                                       fromSeedDatabaseAtPath:seedDatabasePath
                                                            withConfiguration:nil
                                                                      options:options
                                                                        error:&error];
    if (!persistentStore) {
        NSLog(@"Failed to create persistent store : %@", error.description);
    }
    
    [self createManagedObjectContexts];
}

- (NSManagedObjectContext*)managedObjectContext
{
    if (!_outsideManagedObjectContext) {
        _outsideManagedObjectContext = [self newChildManagedObjectContextWithConcurrencyType:NSMainQueueConcurrencyType tracksChanges:YES];
    }
    return _outsideManagedObjectContext;
}

- (CCTrip *)newTrip
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CCTrip" inManagedObjectContext:self.managedObjectContext];
    CCTrip *trip = (CCTrip *)[[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];

    return trip;
}


- (void)save
{
    NSError *executeError = nil;
    if(![self.managedObjectContext saveToPersistentStore:&executeError]) {
        NSLog(@"Failed to save to data store");
    }
}

- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                         forModel:(Class) model
                  completionBlock:(CCDataStoreFetchCompletionBlock)completionBlock
{
    if (![model isSubclassOfClass:[CCManagedObject class]]) {
        return;
    }
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([model class])];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:nil];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (completionBlock)
        {
            completionBlock(results);
        }
    }];
}

@end
