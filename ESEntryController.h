//
//  ESEntryController.h
//  Entries
//
//  Created by Chad on 9/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXEntry.h"

// static NSString * const TitleKey = @"titleKey";
// static NSString * const TextKey = @"textKey";

@interface ESEntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (ESEntryController *)sharedInstance;
// - (void)addEntry:(NSDictionary *)entry;
// - (void)removeEntry:(NSDictionary *)entry;
// - (void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry;
- (void)addEntry:(DXEntry *)entry;
- (void)removeEntry:(DXEntry *)entry;
- (void)replaceEntry:(DXEntry *)oldEntry withEntry:(DXEntry *)newEntry;
- (void)loadFromDefaults;
- (void)synchronize;

@end
