//
//  FirebaseController.h
//  DayX
//
//  Created by Brock Oberhansley on 10/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@interface FirebaseController : NSObject

+ (Firebase *) base;

+(void) creatAccount:(NSString *)userName password:(NSString *)password;

+(void) login;


@end
