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

@interface HomeViewController :BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)advanceSearchButton:(id)sender;

- (IBAction)searchButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *advanceSearchButton;

@property (weak, nonatomic) IBOutlet UIImageView *searchImageView;

- (void)validateHospitalName:(NSString *)name completion:(void (^)(BOOL isValidate, NSString *message))completion;

@property (nonatomic,strong) NSMutableArray *hospitalDatas;

@end
