//
//  HomeViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "ApiRequest.h"
#import "AppDelegate.h"

@interface HomeViewController :BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *advanceSearchButton;
@property (nonatomic,strong) NSMutableArray *hospitalDatas;

- (IBAction)advanceSearchButton:(id)sender;
- (IBAction)searchButton:(id)sender;

@end
