//
//  BaseViewController.h
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Storyboard.h"
#import "Hospital.h"
#import "ApiRequest.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIAlertController+Blocks.h"

@interface BaseViewController : UIViewController

- (void)showHUD;

- (void)hideHUD;

-(void)showMenuButton;

-(void)showBackButton;

- (void)showMessage:(NSString *)title message:(NSString *)message;

@end
