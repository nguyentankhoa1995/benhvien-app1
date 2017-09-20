//
//  AccountViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/18/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AccountViewController.h"
#import "LoginViewController.h"
#import "UserDataManager.h"
#import "ChangePasswordViewController.h"
#import "BaseNavigationController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tài khoản";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showMenuButton];
    self.accountNameTextField.text = [UserDataManager sharedClient].fullName;
    self.accountEmailTextField.text = [UserDataManager sharedClient].email;
    self.accountCityTextField.text = [UserDataManager sharedClient].city;
}

- (IBAction)changePaswordButton:(id)sender {
    ChangePasswordViewController *vc = (ChangePasswordViewController *)[ChangePasswordViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:true completion:nil];
}

@end
