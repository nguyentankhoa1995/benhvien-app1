//
//  BaseTabBarController.h
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController

@property(assign,nonatomic) BOOL menuDisplayed;

- (void)animatedMenu:(BOOL)displayed;

@end
