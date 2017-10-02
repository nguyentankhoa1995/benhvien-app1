//
//  MenuView.m
//  benhvien-app1
//
//  Created by 507-8 on 8/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "MenuView.h"
#import "MenuViewCell.h"
#import "UserDataManager.h"
#import "AccountViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"
#import "HomeViewController.h"

@interface MenuView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MenuView

- (void)setupMenuView {
    _accountImageView.layer.cornerRadius = 17;
    _accountImageView.layer.borderWidth = 0.5;
    _menuItems = [NSArray new];
    _menuTableView.dataSource = self;
    _menuTableView.delegate = self;
    _menuTableView.estimatedRowHeight = 60.0;
    [_menuTableView registerNib:[UINib nibWithNibName:@"MenuViewCell" bundle:nil] forCellReuseIdentifier:@"MenuViewCell"];
    self.menuTableView.tableFooterView = [UIView new];
    [self.menuTableView setScrollEnabled:false];
    self.nameAccountLabel.text = [UserDataManager sharedClient].fullName;
}

- (void)setMenuItems:(NSArray *)menuItems {
    _menuItems = menuItems;
    [_menuTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuViewCell *cell = (MenuViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MenuViewCell"];
    if (!cell) {
        cell = [[MenuViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuViewCell"];
    }
    
    NSDictionary *dic = _menuItems[indexPath.row];
    NSString *imgName = [dic objectForKey:@"icon"];
    NSString *title = [dic objectForKey: @"title"];
    cell.iconImage.image = [UIImage imageNamed:imgName];
    cell.titleLabel.text = title;
    UIView *view = [UIView new];
    view.backgroundColor = [[UIColor alloc]initWithRed:226.0/255 green:56.0/255.0 blue:67.0/255.0 alpha:1 ];
    cell.selectedBackgroundView = view;
    return cell;
}

- (IBAction)didAccountScreenButton:(id)sender {
    if (self.onDidSelectHeader) {
        self.onDidSelectHeader();
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    if (self.onDidSelectItemAtIndex){
        self.onDidSelectItemAtIndex(indexPath.row + 1);
        
    }
}

@end
