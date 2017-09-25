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
#import <OCGoogleDirectionsAPI/OCGoogleDirectionsAPI.h>
#import <GoogleMaps/GoogleMaps.h>


@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation SearchResultViewController
@synthesize hospitalList = _hospitalList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Kết quả";
    self.resultTableView.tableFooterView = [UIView new];
    __weak SearchResultViewController *wSelf = self;
    [self.resultTableView addPullToRefreshWithActionHandler:^{
        if (wSelf.type == HOME) {
            [wSelf.resultTableView.pullToRefreshView stopAnimating];
            return ;
        }
        
        if (wSelf.type == CITY) {
            [wSelf loadMoreCity];
        }
        
        if (wSelf.type == DISTRICT) {
            
        }
    }];
    [self.resultTableView addInfiniteScrollingWithActionHandler:^{
        if (wSelf.type == HOME) {
            [wSelf.resultTableView.infiniteScrollingView stopAnimating];
            return ;
        }
        
        if (wSelf.type == CITY) {
            [wSelf loadMoreCity];
        }
        
        if (wSelf.type == DISTRICT) {
            [wSelf loadMoreDistrict];
        }
    }];
}
    
- (void)refreshCity {
    [self searchHospitalByCity:_city page:1 loadMode:REFRESH];
}

- (void)refreshDistrict {
    
}
    
- (void)loadMoreCity {
    if (self.currentPage < self.totalPage) {
        self.resultTableView.showsInfiniteScrolling = true;
        [self searchHospitalByCity:self.city page:self.currentPage + 1 loadMode:LOADMORE];
    }else {
        self.resultTableView.showsInfiniteScrolling = false;
    }
}
    
- (void)loadMoreDistrict {
    
}
    
- (void)displayData:(NSMutableArray *)data currentPage:(NSInteger)page loadMode:(LoadMode)loadMode {
    if (loadMode == REFRESH) {
        self.currentPage = page;
        [self.hospitalList removeAllObjects];
        self.hospitalList = data;
        [self.resultTableView reloadData];
        [self.resultTableView.pullToRefreshView stopAnimating];
    }else {
        self.currentPage = page;
        [self.hospitalList addObjectsFromArray:[data mutableCopy]];
        [self.resultTableView reloadData];
        [self.resultTableView.infiniteScrollingView stopAnimating];
    }
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setHospitalList:(NSMutableArray *)hospitalList{
    _hospitalList =  hospitalList;
    [self.resultTableView reloadData];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.resultTableView.estimatedRowHeight = 91.0;
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
    [cell setDataForCell:hos];
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
    
- (void)searchHospitalByCity:(NSString *)city page:(NSInteger )page loadMode:(LoadMode)loadMode {
    __weak SearchResultViewController *wSelf = self;
    [self showHUD];
    [ApiRequest searchHospitalByCity:city page:page completionBlock:^(ApiResponse *response, NSError *error) {
        [self hideHUD];
        if (error) {
            [self showMessage:@"Lỗi" message:error.localizedDescription];
        }else {
            NSArray *cityArray = [response.data objectForKey:@"hospitals"];
            if(cityArray.count > 0) {
                NSMutableArray *cities = [NSMutableArray new];
                for (NSDictionary *citiesData in cityArray ){
                    Hospital *city = [Hospital initWithResponse:citiesData];
                    [cities addObject: city];
                    [wSelf displayData:_hospitalList currentPage:page loadMode:loadMode];
                }
            }else {
                [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
            }
        }
    }];
}
    
- (void)searchHospital:(NSString *)city district:(NSString *)district page:(NSInteger)page{
    [self showHUD];
    [ApiRequest searchHospitalByCityandDistrict:city district:district page:page completionBlock:^(ApiResponse *response, NSError *error){
        [self hideHUD];
        if(error) {
            [self showMessage:@"Lỗi" message:error.localizedDescription];
        }else {
            if(response.success) {
                NSArray *hospitalArray = [response.data objectForKey:@"hospitals"];
                if(hospitalArray.count > 0) {
                    NSMutableArray *hospitals = [NSMutableArray new];
                    for (NSDictionary *hospitalsData in hospitalArray ){
                        Hospital *hos = [Hospital initWithResponse:hospitalsData];
                        [hospitals addObject: hos];
                    }
                                    }else {
                    [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
                }
            }else {
                [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
            }
        }
    }];
}

@end
