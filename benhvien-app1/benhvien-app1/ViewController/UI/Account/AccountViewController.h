//
//  AccountViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 9/18/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"

@interface AccountViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *accountNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountCityLabel;

@property (strong,nonatomic)NSMutableArray *accountList;
@end
