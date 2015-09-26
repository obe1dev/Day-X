//
//  EntryController.h
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray * entries;


+ (EntryController *) sharedInstance;

- (Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

-(void) addEntry:(Entry *)entry;

-(void) removeEntry:(Entry *)entry;

@end
