//
//  MenuView.h
//  benhvien-app1
//
//  Created by 507-8 on 8/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView

@property (strong,nonatomic) NSArray *menuItems;
@property (weak,nonatomic) IBOutlet UITableView *menuTableView;
@property (copy,nonatomic) void (^onDidSelectItemAtIndex)(NSUInteger index);
@property (weak, nonatomic) IBOutlet UILabel *nameAccountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *accountImageView;

- (void)setupMenuView;

@end
