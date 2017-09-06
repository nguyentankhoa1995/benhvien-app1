//
//  FirstLoginViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 9/6/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Storyboard.h"
#import "ApiRequest.h"
#import "BaseViewController.h"

@interface FirstLoginViewController : BaseViewController

- (IBAction)emailButtonPressed:(id)sender;
- (IBAction)facebookButtonPressed:(id)sender;


@end
