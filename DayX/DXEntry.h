//
//  DXEntry.h
//  DayX
//
//  Created by Chad on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXEntry : NSObject


@property (nonatomic, strong) const NSString *title;
@property (nonatomic, strong) const NSString *note;
@property (nonatomic, strong) const NSDate *timestamp;

@end
