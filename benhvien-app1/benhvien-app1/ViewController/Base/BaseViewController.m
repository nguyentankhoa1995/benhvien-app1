//
//  BaseViewController.m
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import "BaseViewController.h"

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
-(void)showMenuButton{
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav-menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuButtonPresent:)];
    self.navigationItem.leftBarButtonItem= menuButton;
}
-(void)showBackButton{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav-menu"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPresed:)];
    self.navigationItem.leftBarButtonItem= backButton;

}
-(IBAction)menuButtonPresent:(id)sender{
    
}
-(IBAction)backButtonPresed:(id)sender{
    [self.navigationController popViewControllerAnimated:true];
}
@end
