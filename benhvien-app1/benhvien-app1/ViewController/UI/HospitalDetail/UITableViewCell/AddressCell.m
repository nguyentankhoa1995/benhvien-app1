//
//  AddressCell.m
//  benhvien-app1
//
//  Created by 507-8 on 7/31/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AddressCell.h"
#import "Hospital.h"
#import "AddressModel.h"

@implementation AddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-  (void)configureCell:(id)model {
    AddressModel *hospital = (AddressModel *)model;
    if (hospital) {
        self.hospitalAddressLabel.text = hospital.street ;
    }
}

@end
