//
//  MenuView.m
//  benhvien-app1
//
//  Created by 507-8 on 8/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "MenuView.h"
#import "MenuViewCell.h"

@interface MenuView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MenuView

- (void)setupMenuView {
    _menuItems = [NSArray new];
    _menuTableView.dataSource = self;
    _menuTableView.delegate = self;
    _menuTableView.estimatedRowHeight = 60.0;
    [_menuTableView registerNib:[UINib nibWithNibName:@"MenuViewCell" bundle:nil] forCellReuseIdentifier:@"MenuViewCell"];
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    if (self.onDidSelectItemAtIndex){
        self.onDidSelectItemAtIndex(indexPath.row);
    }
}

@end
