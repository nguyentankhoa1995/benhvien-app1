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
#import "BaseViewController.h"
#import "Hospital.h"
#import "SearchResultViewController.h"
#import "DirectionViewController.h"

@interface HomeViewController ()<UITextFieldDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tìm kiếm";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    _searchButton.layer.cornerRadius = 4.0;
    _advanceSearchButton.layer.cornerRadius = 4.0;
    [self showMenuButton];
}

- (IBAction)searchButton:(id)sender {
    NSString *hospitalName = self.searchTextField.text;
    [self validateHospitalName:hospitalName completion:^(BOOL isValidate, NSString *message){
        if (isValidate) {
            [self searchHospital: hospitalName];
        }else{
            [self showMessage:@"Lỗi" message:message];
        }
    }];
}

- (void)searchHospital:(NSString *)hospitalName {
    [self showHUD];
    [ApiRequest searchHospitalByName:hospitalName completionBlock:^(ApiResponse * response, NSError *error){
        [self hideHUD];
        if (error) {
            [self showMessage:@"Lỗi" message:error.description];
        }else {
            NSArray *hospitals = [response.data objectForKey:@"hospitals"];
            if (hospitals.count <= 0) {
                [self showMessage:@"Thông báo" message:@"Không tìm thấy bệnh viện nào" ];
            }else {
                NSMutableArray *hospitalData = [NSMutableArray new];
                for (NSDictionary *data in hospitals) {
                    Hospital *hos = [Hospital initWithResponse:data];
                    [hospitalData addObject:hos];
                }
                [self passData:hospitalData];
            }
        }
    }];
}

- (void)validateHospitalName:(NSString *)name completion:(void (^)(BOOL isValidate, NSString *message))completion {
    if (!name || name.length == 0) {
        completion(NO, @"Bạn phải nhập tên bệnh viện");
        return;
    }
    completion(YES, @"");
}

- (IBAction)advanceSearchButton:(id)sender {
    AdvanceViewController *vc =(AdvanceViewController *)[AdvanceViewController instanceFromStoryboardName:@"Home"];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)passData :(NSMutableArray *)hospital {
    SearchResultViewController *vc = (SearchResultViewController *)[SearchResultViewController instanceFromStoryboardName:@"Home"];
    vc.hospitalList = hospital;
    [self.navigationController pushViewController:vc animated:true];
    
}

@end
