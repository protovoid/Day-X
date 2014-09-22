//
//  DXEntry.m
//  DayX
//
//  Created by Chad on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXEntry.h"

@implementation DXEntry

-(NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title != nil) {
        entryDictionary[@"title"] = self.title;
    }
    
    if (self.note != nil) {
        entryDictionary[@"note"] = self.note;
    }
    
    if (self.timestamp != nil) {
        entryDictionary[@"timestamp"] = self.timestamp;
    }
    
    return entryDictionary;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    if (self != nil) {
        self.title = [dictionary objectForKey:@"title"];
        self.note = [dictionary objectForKey:@"note"];
        self.timestamp = [dictionary objectForKey:@"timestamp"];
    }
    return self;
}



@end
