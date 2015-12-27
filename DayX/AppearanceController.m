//
//  AppearanceController.m
//  My-Pomodoro
//
//  Created by Brock Oberhansley on 10/1/15.
//  Copyright © 2015 Brock Oberhansley. All rights reserved.
//

#import "AppearanceController.h"


@implementation AppearanceController


+(void)setUpAppearance{
    [UINavigationBar appearance].barTintColor = [UIColor purpleColor];
    //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    //set the color of the tit
    NSDictionary *titleTextAttributes = @{
                                          NSForegroundColorAttributeName : [UIColor whiteColor],
                                          NSFontAttributeName : [UIFont fontWithName:@"Avenir-Light" size:20]
                                          };
    [[UIBarButtonItem appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    
    
    [UITableView appearance].sectionIndexBackgroundColor = [UIColor grayColor];
    [UITableView appearance].sectionIndexTrackingBackgroundColor = [UIColor blackColor];
}

//sets the appearance
+(void) initializeAppearanceDefaults{
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                          NSForegroundColorAttributeName: [UIColor blackColor],
                                                          NSFontAttributeName: [UIFont fontWithName:@"Avenir-Light" size:20]
                                                          }];
    [[UITabBar appearance] setTintColor:[UIColor purpleColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UITableView appearance] setTintColor:[UIColor purpleColor]];
}

@end
