//
//  LoginViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 9/6/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


typedef enum {
    LOGIN,
    REGISTERS
}LoginViewState;

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *loginContentView;
@property (weak, nonatomic) IBOutlet UIView *registerContentView;
@property (weak, nonatomic) IBOutlet UITextField *loginUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *passUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;


- (IBAction)loginSegment:(UISegmentedControl *)sender;



@end
