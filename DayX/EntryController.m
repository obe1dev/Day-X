//
//  EntryController.m
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        sharedInstance.entries = [NSArray new];
    });
    return sharedInstance;
}


- (Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText {
    Entry *entry = [Entry new];
    entry.title = title;
    entry.bodyText = bodyText;
    entry.timestamp = [NSDate date];
    
    [self addEntry:entry];
    
    return entry;
}


-(void) addEntry:(Entry *) entry;{
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *entryList = self.entries.mutableCopy;
    [entryList addObject:entry];
    self.entries = entryList;
    
    
}

-(void) removeEntry:(Entry *)entry;{
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *entryList = self.entries.mutableCopy;
    [entryList removeObject:entry];
    self.entries = entryList;
    
    
}


@end
