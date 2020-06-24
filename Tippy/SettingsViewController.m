//
//  SettingsViewController.m
//  Tippy
//
//  Created by Adrienne Li on 6/23/20.
//  Copyright © 2020 ahli. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *percentageField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onEdit:(id)sender {
    double defaultPercentage = [self.percentageField.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

@end
