//
//  LoginViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/6/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"
#import "PlacesViewController.h"


@interface LoginViewController ()
{

}
@property (assign , nonatomic) LoginViewState loginState;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    self.title = @"Đăng nhập";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Xong" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Huỷ bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (void)showLogin {
    self.title = @"Đăng nhập";
    _registerContentView.hidden = false;
    _loginContentView.hidden = true;
    _loginState = LOGIN;
}

- (void)showRegister {
    self.title = @"Đăng kí";
    _loginContentView.hidden = false;
    _registerContentView.hidden = true;
    _loginState = REGISTERS;
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.view endEditing:true];
    if (_loginState == REGISTERS) {
        [self registerUser];
    }else {
        [self loginUser];
    }
}

- (void)registerUser {
   
}

- (void)loginUser {
    NSString *email = self.loginUserTextField.text;
    NSString *password = self.loginPasswordUserTextField.text;
    [self validateEmail:email password:password completion:^(NSString *message, BOOL isValid) {
        if (isValid) {
            [self loginWithEmail:email password:password];
        }else {
            [self showMessage:@"Lỗi" message:message];
        }
    }];
}

- (void)loginWithEmail:(NSString *)email password:(NSString *)password {
    [self showHUD];
    [ApiRequest loginWithEmail:email password:password completionBlock:^(ApiResponse *response, NSError *error) {
        [self hideHUD];
        if (error || !response.success) {
            [self showMessage:@"Lỗi" message:response.message];
        }else {
            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [app setupHomeScreen1];
        }
    }];
}


- (void)validateEmail:(NSString *)email password:(NSString *)password completion:(void(^)(NSString *message, BOOL isValid))block {
    if (!email || email.length == 0) {
        block(@"Bạn vui lòng nhập email", false);
        return;
    }
    
    if (!password || password.length == 0) {
        block(@"Bạn vui lòng nhập mật khẩu", false);
        return;
    }
    
    block(@"", true);
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


- (IBAction)loginSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    if (selectedSegment == 0) {
        [self showRegister];
    }else {
        [self showLogin];
    }
    
}

- (IBAction)cityButtonPressed:(id)sender {
    PlacesViewController *vc = (PlacesViewController *)[PlacesViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *nav =  [[BaseNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:true completion:nil];
}

@end
