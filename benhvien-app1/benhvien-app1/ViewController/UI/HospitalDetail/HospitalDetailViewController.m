//
//  HospitalDetailViewController.m
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import "HospitalDetailViewController.h"

@interface HospitalDetailViewController ()

@end

@implementation HospitalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.title = self.hospital.name;
}

@end
