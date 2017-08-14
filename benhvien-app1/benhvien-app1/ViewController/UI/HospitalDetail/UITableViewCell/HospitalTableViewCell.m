//
//  HospitalTableViewCell.m
//  benhvien-app1
//
//  Created by 507-8 on 7/31/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "HospitalTableViewCell.h"

@implementation HospitalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setDataForCell:(id)data{
    Hospital *hospital = (Hospital *)data;
    if(hospital){
        [self.hospitalImage sd_setImageWithURL:[NSURL URLWithString:hospital.avatar]];
        self.hospitalNameLabel.text = hospital.name;
        if(hospital.phones[0]){
            self.phonenumberLabel.text = hospital.phones[0];
        }else{
            self.phonenumberLabel.text = @"-";
        }
        self.hospitalAddressLabel.text =hospital.street;
    }
}

@end
