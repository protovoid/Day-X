//
//  DetailViewController.h
//  DayX
//
//  Created by Chad on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXEntry.h"

// static NSString * const EntryKey = @"entry";

@interface DetailViewController : UIViewController


// @property (strong, nonatomic) NSDictionary *dictionary;

//- (void)updateWithDictionary:(NSDictionary *)dictionary;

- (void)updateEntry:(DXEntry *)entry;


@end
