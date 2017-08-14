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
    _searchTextField.layer.cornerRadius = 4.0;
    _searchTextField.layer.borderWidth = 0.5;
    _searchTextField.layer.borderColor = [UIColor colorWithHex:0xC8C7CC].CGColor;
    _searchButton.layer.cornerRadius = 4.0;
    _advanceSearchButton.layer.cornerRadius = 4.0;
    self.searchImageView.layer.cornerRadius = 4.0;
    [self showMenuButton];
}

- (IBAction)searchButton:(id)sender {
    [self showHUD];
//    [ApiRequest loginWithEmail:@"haole@gmail.com" password:@"111111" completionBlock:^(ApiResponse *respone, NSError *error ){
//    
//    }];
    NSString *hospitalName = self.searchTextField.text;
    [self validateHospitalName:hospitalName completion:^(BOOL isValidate, NSString *message){
        [self hideHUD];
        if (isValidate){
            [self searchHospital: hospitalName];
            
        }else{
            [self showMessage:@"Lỗi" message:message];
        }
        
    }];
}



-(void)searchHospital:(NSString *)hospitalName{
 [self showHUD];
    [ApiRequest seachHospitalByName:hospitalName completionBlock:^(ApiResponse * response, NSError *error){
        [self hideHUD];
        NSArray *hospitals = [response.data objectForKey:@"hospitals"];
        if (hospitals.count <= 0) {
            [self showMessage:@"Thông báo" message:@"Không tìm thấy bệnh viện nào" ];
        }else {
            self.hospitalDatas = [NSMutableArray new];
            for (NSDictionary *hospitalData in hospitals) {
                Hospital *hos = [Hospital initWithResponse:hospitalData];
                [self.hospitalDatas addObject:hos];
               
                
            }
            [self passData];
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

- (void)passData{
    SearchResultViewController *vc = (SearchResultViewController *)[SearchResultViewController instanceFromStoryboardName:@"Home"];
    vc.hospitalList = _hospitalDatas;
    [self.navigationController pushViewController:vc animated:true];
    
}

@end
