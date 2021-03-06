//
//  ListViewController.m
//  DayX
//
//  Created by Brock Oberhansley on 9/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "EntryController.h"
#import "FirebaseController.h"



@interface ListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
    
}
 //TODO: something

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *viewController = segue.destinationViewController;
        
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        viewController.entry = entry;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [FirebaseController creatAccount:@"ob1.bwo@gmail.com" password:@"brock"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTabelView) name:@"loadEntries" object:nil];
    
}

-(void) reloadTabelView{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
