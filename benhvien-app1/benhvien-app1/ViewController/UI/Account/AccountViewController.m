//
//  AccountViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/18/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AccountViewController.h"
#import "LoginViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tài khoản";
    self.accountList = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
