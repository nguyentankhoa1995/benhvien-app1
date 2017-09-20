//
//  AccountViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 9/18/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiRequest.h"

@interface AccountViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *accountNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *accountEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *accountCityTextField;

- (IBAction)changePaswordButton:(id)sender;
@property (strong,nonatomic)NSMutableArray *accountList;
@end
