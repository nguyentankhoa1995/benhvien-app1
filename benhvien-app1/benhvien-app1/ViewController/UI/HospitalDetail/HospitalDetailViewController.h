//
//  HospitalDetailViewController.h
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import "BaseViewController.h"
#import "Hospital.h"
#import "HLTableView.h"

@interface HospitalDetailViewController : BaseViewController


@property (weak, nonatomic) IBOutlet HLTableView *contentView;
@property (strong, nonatomic) Hospital *hospital;

@end
