//
//  EntryController.m
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import <Firebase/Firebase.h>
#import "FirebaseController.h"

static NSString * const AllEntriesKey = @"AllEntriesKey";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController


//question is it always just one sharedInstance method?
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
    
//question what is muteabelCopy
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
        
//question what is dictionaryRepresentation
        [entryDictionaries addObject:[entry dictionaryRepresentation]];
    }
    
    
    //comment out this line for firebase
    //[entryDictionaries writeToFile:self.pathToFile atomically:YES];
    Firebase *base =[[Firebase alloc]initWithUrl:@"https://devmtnbrock.firebaseio.com/entries/"];
    
    [base setValue:entryDictionaries];
}


- (void) save:(NSArray *) entries{
    [self saveToPersistentStorage];
}


- (void)loadFromPersistentStorage {
    
    //comment out this line for firebase
   // NSArray *entryDictionaries = [NSArray arrayWithContentsOfFile:self.pathToFile];
    
    //@"https://devmtnbrock.firebaseio.com/entries/"
    //@"https://devmtndemo.firebaseIO.com/entries/"
    
    
    Firebase *base =[[Firebase alloc]initWithUrl:@"https://devmtnbrock.firebaseio.com/entries/"];
    [base observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        NSMutableArray *entries = [NSMutableArray new];
        
        for (NSDictionary *entry in snapshot.value) {
            
            
            [entries addObject:[[Entry alloc] initWithDictionary:entry]];
        }
        self.entries = entries;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadEntries" object:nil];

    }];
    
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
