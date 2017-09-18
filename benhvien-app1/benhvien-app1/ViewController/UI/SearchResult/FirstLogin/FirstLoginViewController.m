//
//  FirstLoginViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/6/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "FirstLoginViewController.h"
#import "LoginViewController.h"
#import "BaseNavigationController.h"


@interface FirstLoginViewController ()

@end

@implementation FirstLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)emailButtonPressed:(id)sender {
    LoginViewController *vc = (LoginViewController *)[LoginViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:true completion:nil];
}

- (IBAction)facebookButtonPressed:(id)sender {
   
}

@end
