//
//  HospitalNameCell.m
//  benhvien-app1
//
//  Created by 507-8 on 7/31/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "HospitalNameCell.h"
#import "HospitalNameModel.h"
#import "SearchResultViewController.h"
#import "HomeViewController.h"
#import "HospitalNameModel.h"

@implementation HospitalNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCell:(id)model {
    HospitalNameModel *hospital = (HospitalNameModel *)model;
    if (hospital) {
        self.hospitalNameLabel.text = hospital.name;
    }
}
    
@end
