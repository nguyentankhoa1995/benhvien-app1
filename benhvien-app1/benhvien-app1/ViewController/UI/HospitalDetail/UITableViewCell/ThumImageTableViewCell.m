//
//  ThumbImageTableViewCell.m
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import "ThumImageTableViewCell.h"
#import "Hospital.h"

@implementation ThumImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCell:(NSString *)data {
    Hospital *hospital = (Hospital *)data;
    if (hospital) {
        self.hospitalLocationTextView.text = hospital.hospitalDescipton ;
    }
}

@end
