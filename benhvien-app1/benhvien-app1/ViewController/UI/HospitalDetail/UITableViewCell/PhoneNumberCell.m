//
//  PhoneNumberCell.m
//  benhvien-app1
//
//  Created by 507-8 on 7/31/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "PhoneNumberCell.h"
#import "Hospital.h"

@implementation PhoneNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCell:(id)data {
    Hospital *hospital = (Hospital *)data;
    if(hospital.phones[0]){
        self.hospitalPhoneLabel.text = hospital.phones[0];
    }else{
        self.hospitalPhoneLabel.text = @"-";
    }

}
@end

  
