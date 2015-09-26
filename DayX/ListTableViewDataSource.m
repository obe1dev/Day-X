//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Brock Oberhansley on 9/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import <UIKit/UIKit.h>
#import "EntryController.h"



@implementation ListTableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"entryCell"];
    
    Entry *enrty = [EntryController sharedInstance].entries[indexPath.row];
    
    cell.textLabel.text = enrty.title;
    
  
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    return cell;
}

@end
