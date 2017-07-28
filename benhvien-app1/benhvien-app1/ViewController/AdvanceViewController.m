//
//  AdvanceViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AdvanceViewController.h"
#import "UIColor+Hex.h"
#import "SearchResultViewController.h"

@interface AdvanceViewController ()

@end

@implementation AdvanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tim kiem nang cao";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUpUserInterface{
    [self showBackButton];
    _cityContentView.layer.cornerRadius =4.0;
    _cityContentView.layer.borderWidth = 0.5;
    _cityContentView.layer.borderColor = [UIColor colorWithHex:0xC87CC].CGColor;
    _districContentView.layer.cornerRadius =4.0;
    _districContentView.layer.borderWidth = 0.5;
    _districContentView.layer.borderColor = [UIColor colorWithHex:0xC87CC].CGColor;
    _findButton.layer.cornerRadius = 4.0;
}

- (IBAction)findBtn:(id)sender {
    SearchResultViewController *vc = [SearchResultViewController instanceFromStoryboardName:@"Home"];
    [self.navigationController pushViewController:vc animated:true];
}
@end
