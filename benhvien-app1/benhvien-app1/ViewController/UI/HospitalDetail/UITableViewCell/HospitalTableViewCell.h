//
//  HospitalTableViewCell.h
//  benhvien-app1
//
//  Created by 507-8 on 7/31/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Hospital.h"

@interface HospitalTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *hospitalAddressLabel;

@property (weak, nonatomic) IBOutlet UILabel *phonenumberLabel;

@property (weak,nonatomic)  IBOutlet UIImageView *hospitalImage;

@end
