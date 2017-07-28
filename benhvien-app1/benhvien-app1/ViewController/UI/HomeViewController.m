//
//  HomeViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+Hex.h"
#import "UIViewController+Storyboard.h"
#import "BaseNavigationController.h"
#import "AdvanceViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Find";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(void)setUpUserInterface{
    _searchTextField.layer.cornerRadius = 4.0;
    _searchTextField.layer.borderWidth = 0.5;
    _searchTextField.layer.borderColor = [UIColor colorWithHex:0xC8C7CC].CGColor;
    _searchButton.layer.cornerRadius = 4.0;
    _advanceSearchButton.layer.cornerRadius = 4.0;
    [self showMenuButton];
}

- (IBAction)searchButton:(id)sender {
}
- (IBAction)advanceSearchButton:(id)sender {
    AdvanceViewController *vc =(AdvanceViewController *)[AdvanceViewController instanceFromStoryboardName:@"Home"];
    [self.navigationController pushViewController:vc animated:true];
}



@end
