//
//  ChangePasswordViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/15/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "UserDataManager.h"
#import "AppDelegate.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Đổi mật khẩu";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
//    self.title = @"Đăng nhập";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Huỷ bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.view endEditing:true];
    NSString *oldPassword = self.oldPasswordTexField.text;
    NSString *newPassword = self.passwordNewTextField.text;
    NSString *changePassword = self.changePasswordTextField.text;
    [self validateOldPassword:oldPassword newPassword:newPassword changePassword:changePassword completion:^(NSString *message, BOOL isValid) {
        if (!isValid) {
            [self showMessage:@"Lỗi" message:message];
        }else {
        
            [self changePasswordWithUserId:[UserDataManager sharedClient].userId
                               oldPassword:oldPassword
                               newPassword:newPassword];
        }
    }];

        
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.view endEditing:true];
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Xác nhận"
                                         message:@"Bạn có chắc chắn muốn huỷ bỏ?"
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Yes"
                               otherButtonTitles:nil
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                            if (buttonIndex == controller.cancelButtonIndex) {
                                                
                                            } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                [self.navigationController dismissViewControllerAnimated:true completion:nil];
                                            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                
                                            }
                                        }];
    
}


- (void)changePasswordWithUserId: (NSString *)userId
                     oldPassword:(NSString *)oldPassword
                     newPassword:(NSString *)newPassword {
    [self showHUD];
    [ApiRequest changePasswordWithUserId:userId oldPassword:oldPassword newPassword:newPassword completionBlock:^(ApiResponse *response, NSError *error) {
                [self hideHUD];
            if (error || !response.success) {
                [self showMessage:@"Lỗi" message:response.message];
            }else {
                [self.navigationController dismissViewControllerAnimated:true completion:nil];
            }

    }];

}

- (void)validateOldPassword:(NSString *)oldPassword
                newPassword:(NSString *)newPassword
             changePassword:(NSString *)changePassword completion:(void(^)(NSString *message, BOOL isValid))block {
    if (!oldPassword || oldPassword.length == 0) {
        block(@"Bạn vui lòng mật khẩu cũ", NO);
        return;
    }
    
    if (!newPassword || newPassword.length == 0) {
        block(@"Bạn vui lòng nhập mật khẩu mới", NO);
        return;
    }
    
    if (!changePassword || changePassword.length == 0) {
        block(@"Vui lòng nhập lại mật khẩu mới", NO);
    }
    
    if (![newPassword isEqualToString:changePassword]) {
         block(@"Mật khẩu không trùng khớp", NO);
        return;
    }
    
    block(@"", YES);
}



@end
