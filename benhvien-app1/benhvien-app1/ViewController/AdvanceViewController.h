//
//  AdvanceViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"
#import "IQDropDownTextField.h"
@interface AdvanceViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *cityContentView;
@property (weak, nonatomic) IBOutlet UIView *districContentView;
- (IBAction)findBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *findButton;

@end
