//
//  BaseTabBarController.m
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MenuView.h"

@interface BaseTabBarController ()

@property(strong,nonatomic) MenuView *menuView;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupMenuView {
    NSArray *nibViews = [[NSBundle mainBundle]loadNibNamed:@"MenuView" owner:self options:nil];
    _menuView = (MenuView *)[nibViews objectAtIndex:0];
    UIWindow *window = [[[UIApplication sharedApplication] delegate]window];
    [window addSubview:_menuView];
}

- (void)animatedMenu:(BOOL)displayed {
    _menuDisplayed = displayed;
    CGFloat duration = 0.3;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat posX = (300.0/385.0) * screenWidth;
    CGRect frame = self.view.frame;
    if (displayed) {//open menu
        frame.origin.x = posX;
    }else {//close menu
        frame.origin.x = 0.0;
    }
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = frame;
    }];
}

@end
