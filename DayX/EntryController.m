//
//  EntryController.m
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString * const AllEntriesKey = @"AllEntriesKey";

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
        [sharedInstance loadFromPersistentStorage];
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
    [self saveToPersistentStorage];
    
    
}

-(void) removeEntry:(Entry *)entry{
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *entryList = self.entries.mutableCopy;
    [entryList removeObject:entry];
    self.entries = entryList;
    [self saveToPersistentStorage];
    
    
}

- (void)saveToPersistentStorage {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:[entry dictionaryRepresentation]];
    }
    
    [entryDictionaries writeToFile:self.pathToFile atomically:YES];
}


- (void) save:(NSArray *) entries{
    [self saveToPersistentStorage];
}

#pragma test

- (void)loadFromPersistentStorage {
    
    NSArray *entryDictionaries = [NSArray arrayWithContentsOfFile:self.pathToFile];
    
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entryDictionaries) {
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    
    self.entries = entries;
}



- (NSString *)pathToFile {
    //Creating a file path:
    //1) Search for the app's documents directory (copy+paste from Documentation)
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //2) Create the full file path by appending the desired file name
    NSString *pathToFile = [documentsDirectory stringByAppendingPathComponent:@"entries.plist"];
    
    return pathToFile;
}




@end
