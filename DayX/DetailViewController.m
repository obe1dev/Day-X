//
//  DetailViewController.m
//  DayX
//
//  Created by Brock Oberhansley on 9/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation DetailViewController


- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        self.entry.title = self.textField.text;
        self.entry.bodyText = self.textView.text;
        self.entry.timestamp = [NSDate date];
    } else {
        self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.textField.text bodyText:self.textView.text];
    }
 
//    Entry *newEntry = [Entry new];
//    newEntry.title = self.textView.text;
//    newEntry.bodyText = self.textField.text;
//    [[EntryController sharedInstance] addEntry:newEntry];
   [self.navigationController popViewControllerAnimated:YES];
//    
//    self.entry = newEntry;
 
    
}

- (IBAction)clearButtonTapped:(id)sender {
    
    self.textField.text = @"";
    self.textView.text = @"";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateWithEntry:self.entry];
    
}

- (void)updateWithEntry:(Entry *)entry {
    self.textField.text = entry.title;
    self.textView.text = entry.bodyText;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
