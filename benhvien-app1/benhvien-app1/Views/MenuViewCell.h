//
//  MenuViewCell.h
//  benhvien-app1
//
//  Created by 507-8 on 8/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewCell : UITableViewCell <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end
