//
//  SearchResultViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "SearchResultViewController.h"
#import "UIColor+Hex.h"
#import "HospitalDetailViewController.h"
#import "Hospital.h"
#import "HospitalTableViewCell.h"
#import "HomeViewController.h"


@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SearchResultViewController
@synthesize hospitalList = _hospitalList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Kết quả";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.resultTableView.estimatedRowHeight = 91.0;
}

- (void)setHospitalList:(NSMutableArray *)hospitalList{
    _hospitalList =  hospitalList;
    [self.resultTableView reloadData];
}

#pragma TableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _hospitalList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HospitalTableViewCell  *cell = (HospitalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell) {
        cell= [[HospitalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" ];
    }
    Hospital *hos = _hospitalList[indexPath.row];
    cell.hospitalNameLabel.text = hos.hospitalId;
    cell.hospitalAddressLabel.text = hos.city;
    cell.phonenumberLabel.text = hos.phones;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    Hospital *hospital = _hospitalList[indexPath.row];
    [self gotoHospitalDetailScreen:hospital];
}

- (void)gotoHospitalDetailScreen: (Hospital *)hospital {
    HospitalDetailViewController *vc = (HospitalDetailViewController *)[HospitalDetailViewController instanceFromStoryboardName:@"Home"];
    vc.hospital = hospital;
    [self.navigationController pushViewController:vc animated:true];
}



@end
