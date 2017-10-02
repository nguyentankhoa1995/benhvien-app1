//
//  BaseTabBarController.m
//  benhvien-app-demo-1
//
//  Created by 507-10 on 7/24/17.
//  Copyright © 2017 507-10. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MenuView.h"
#import <PureLayout/PureLayout.h>
#import "AppDelegate.h"
#import "UserDataManager.h"

@interface BaseTabBarController ()

@property(weak,nonatomic) MenuView *menuView;
@property(assign,nonatomic) BOOL didUpdateConstrians;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = true;
    [self setupMenuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupMenuView {
    NSArray *hosArray = @[@{@"icon":@"search-btn-icon", @"title":@"Tìm kiếm"},
                          @{@"icon":@"information-menu-icon", @"title":@"Thông tin"},
                          @{@"icon":@"logout-icon",@"title":@"Đăng xuất"}];
    NSArray *nibViews = [[NSBundle mainBundle]loadNibNamed:@"MenuView" owner:self options:nil];
    _menuView = (MenuView *)[nibViews objectAtIndex:0];
    UIWindow *window = [[[UIApplication sharedApplication] delegate]window];
    [window addSubview:_menuView];
    [_menuView setupMenuView];
    _menuView.menuItems = hosArray;
    __weak BaseTabBarController *wSelf = self;
    [_menuView setOnDidSelectItemAtIndex:^(NSUInteger index) {
        [wSelf didSelectMenuAtIndenx:index];
    }];
    
    [_menuView setOnDidSelectHeader:^{
        [wSelf didSelectMenuAtIndenx:0];
    }];
}

- (void)updateViewConstraints {
    UIWindow *window = [[[UIApplication sharedApplication] delegate]window];
    [_menuView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:window];
    [_menuView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:window];
    [_menuView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:window];
    [_menuView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:window];
    [super updateViewConstraints];
}

- (void)animatedMenu:(BOOL)displayed {
    _menuDisplayed = displayed;
    CGFloat duration = 0.3;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat posX = (300.0/375.0) * screenWidth;
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

- (void)didSelectMenuAtIndenx:(NSInteger)menuIndex {
    [self animatedMenu:!self.menuDisplayed];
    self.selectedIndex = menuIndex ;
    if (menuIndex == 3) {
        [self logout];
    }
}

- (void)logout {
    [[UserDataManager sharedClient] clearUserData];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication ]delegate];
    [app setupFirstLoginScreen];
}

- (void)closeSideMenuBar {
    
}

@end


