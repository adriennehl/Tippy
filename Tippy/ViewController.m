//
//  ViewController.m
//  Tippy
//
//  Created by Adrienne Li on 6/23/20.
//  Copyright © 2020 ahli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation ViewController

double defaultPercentage = 15;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    defaultPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    NSString *lowTip = [NSString stringWithFormat:@"%.0f %%",defaultPercentage];
    [self.tipControl setTitle:lowTip forSegmentAtIndex:0];
    NSString *medTip = [NSString stringWithFormat:@"%.0f %%",defaultPercentage+5];
    [self.tipControl setTitle:medTip forSegmentAtIndex:1];
    NSString *highTip = [NSString stringWithFormat:@"%.0f %%",defaultPercentage+7];
    [self.tipControl setTitle:highTip forSegmentAtIndex:2];
    [self onEdit:nil];
    
}

- (IBAction)onTap:(id)sender {
    //equivalent to self.view.endEditing(YES);
    [self.view endEditing:YES];
    
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(defaultPercentage/100), @(defaultPercentage/100 + 0.05), @(defaultPercentage/100 + 0.07)];
    // get selected segment index, get double value, get corresponding percent
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f",total];
    
}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y + 30, self.mealBillField.frame.size.width, self.mealBillField.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];
    
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -=30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = newFrame;
    
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}

@end
