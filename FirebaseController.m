//
//  FirebaseController.m
//  DayX
//
//  Created by Brock Oberhansley on 10/17/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "FirebaseController.h"

@implementation FirebaseController

+ (Firebase *) base{
    
    
    return [[Firebase alloc] initWithUrl:@"https://devmtnbrock.firebaseio.com/entries/"];
};

+(void) creatAccount:(NSString *)userName password:(NSString *)password{
    
    [[FirebaseController base] createUser:userName password:password
withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
    if (error) {
        // There was an error creating the account
        NSLog(@"%@",error);
    } else {
        NSString *uid = [result objectForKey:@"uid"];
        NSLog(@"Successfully created user account with uid: %@", uid);
    }
    }];
    
};


+ (void) login {
    
    [[FirebaseController base] authUser:@"alancbarth@gmail.com" password:@"alaniscool" withCompletionBlock:^(NSError *error, FAuthData *authData) {
        NSLog(@"%@", authData);
    }];
    
}
@end
