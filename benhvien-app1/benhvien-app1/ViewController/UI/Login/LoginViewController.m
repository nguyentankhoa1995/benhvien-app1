//
//  LoginViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/6/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    self.title = @"Đăng Kí";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Huỷ bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (IBAction)doneButtonPressed:(id)sender {
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
