//
//  Entry.h
//  DayX
//
//  Created by Brock Oberhansley on 9/24/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * bodyText;
@property (nonatomic, strong) NSDate * timestamp;

@end
