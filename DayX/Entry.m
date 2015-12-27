//
//  Entry.m
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const titleKey = @"titleKey";
static NSString * const bodyTextKey = @"bodyTextKey";
static NSString * const timestampKey = @"timestampKey";


@implementation Entry


- (id) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    self.title = [dictionary objectForKey:titleKey];
    self.bodyText = [dictionary objectForKey:bodyTextKey];
    self.timestamp = [dictionary objectForKey:timestampKey];
    
    return self;
}

- (NSDictionary * ) dictionaryRepresentation {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary setObject:self.title forKey:titleKey];
    [dictionary setObject:self.bodyText forKey:bodyTextKey];
    //firebase wont accept nsdate
    //[dictionary setObject:self.timestamp forKey:timestampKey];
    
    
     return dictionary;
}

@end
