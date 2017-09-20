//
//  ChangePasswordViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 9/15/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"

@interface ChangePasswordViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTexField;
@property (weak, nonatomic) IBOutlet UITextField *passwordNewTextField;
@property (weak, nonatomic) IBOutlet UITextField *changePasswordTextField;
@property (nonatomic)NSString *message;


@end
