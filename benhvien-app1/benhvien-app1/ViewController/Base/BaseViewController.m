//
//  BaseViewController.m
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUserInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showMenuButton {
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav-menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuButtonPresent:)];
    self.navigationItem.leftBarButtonItem= menuButton;
}

-(void)showBackButton {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav-back"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPresed:)];
    self.navigationItem.leftBarButtonItem= backButton;

}

-(IBAction)menuButtonPresent:(id)sender {
    BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
    [tab animatedMenu:!tab.menuDisplayed];
}

-(IBAction)backButtonPresed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)showHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:true];
    });
}

- (void)hideHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:true];
    });
}

- (void)showMessage:(NSString *)title message:(NSString *)message {
    [UIAlertController showAlertInViewController:self withTitle:title message:message cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil tapBlock:nil];
}

@end
