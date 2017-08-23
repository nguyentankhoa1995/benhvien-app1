//
//  AdvanceViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AdvanceViewController.h"
#import "UIColor+Hex.h"
#import "SearchResultViewController.h"
#import "City.h"
#import "UIAlertController+Blocks.h"
#import "UIViewController+Storyboard.h"
#import "ApiRequest.h"
#import "Hospital.h"

@interface AdvanceViewController ()<IQDropDownTextFieldDelegate>
{
    NSMutableArray *_cities;
}

@end

@implementation AdvanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tìm kiếm nâng cao";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showBackButton];
    _cityContentView.layer.cornerRadius = 4.0;
    _cityContentView.layer.borderWidth = 0.5;
    _cityContentView.layer.borderColor = [UIColor colorWithHex:0xC8C7CC].CGColor;
    _districContentView.layer.cornerRadius = 4.0;
    _districContentView.layer.borderWidth = 0.5;
    _districContentView.layer.borderColor = [UIColor colorWithHex:0xC8C7CC].CGColor;
    _searchButton.layer.cornerRadius = 4.0;
    _cities =  [self readCitiesFromFile];
    _cityPicker.delegate = self;
    _districPicker.delegate = self;
    [self setupDistrictDropDowm];
}

- (NSMutableArray *)readCitiesFromFile {
    NSMutableArray *cities = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"json" ];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *cityArray = [jsonDict objectForKey:@"cities"];
    for (NSDictionary *cityData in cityArray){
        City *city = [City initWithData:cityData];
        [cities addObject:city];
    }
    return cities;
}

- (void)getHospitalFromSever {
    [self showHUD];
    [ApiRequest getHospitalCompletionBlock:^(ApiResponse *response , NSError *error){
        [self hideHUD];
        if(error) {
            [self showMessage:@"Lỗi" message:error.localizedDescription];
            
        }else {
            NSMutableArray *cities = [NSMutableArray new];
            NSArray *cityArray = [response.data objectForKey:@"cities"];
            for (NSDictionary *cityData in cityArray){
                City *city = [City initWithData:cityData];
                [cities addObject:city];
            }
            _cities = cities;
            [self setupDistrictDropDowm];
        }
    }];
}

- (NSArray *)getCityNames {
    NSMutableArray *cityName = [NSMutableArray new];
    for(City *city in _cities){
        [cityName addObject:city.name];
    }
    return [cityName mutableCopy];
}

- (NSArray *)getDistrictNameFromCity:(City *)city {
    NSMutableArray *districtName = [NSMutableArray new];
    [districtName addObjectsFromArray:city.district];
    [districtName insertObject:@"Tất cả Quận/Huyện" atIndex:0];
    return [districtName mutableCopy];
}

- (void)setupDistrictDropDowm {
   self.cityPicker.isOptionalDropDown = NO;
    [self.cityPicker setItemList:[self getCityNames]];
    City *selectCity = (City *)_cities[0];
    self.districPicker.isOptionalDropDown = NO;
    [self.districPicker setItemList:[self getDistrictNameFromCity:selectCity]];
    [self.districPicker setSelectedRow:0];
}

- (void)textField:(IQDropDownTextField *)textField didSelectItem:(NSString *)item {
    NSInteger selectIndex = textField.selectedRow;
    if(textField == _cityPicker) {
        City *city = _cities[selectIndex];
        [self.districPicker setItemList:[self getDistrictNameFromCity:city]];
        [self.districPicker setSelectedRow:0];
    }else {
        
    }
}

- (void)searchHospitalByCity:(NSString *)city {
    [self showHUD];
    [ApiRequest searchHospitalByCity:city completionBlock:^(ApiResponse *response, NSError *error) {
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
                }
                [self goToSearchResultViewController:cities];
            }else {
                [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
            }
        }
    }];
}

- (void)searchHospital:(NSString *)city district:(NSString *)district {
    [self showHUD];
    [ApiRequest searchHospitalByCityandDistrict:city district:district completionBlock:^(ApiResponse *response, NSError *error){
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
                    [self goToSearchResultViewController:hospitals];
                }else {
                    [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
                }
            }else {
                [self showMessage:@"Lỗi" message:@"Không tìm thấy bệnh viện nào"];
            }
        }
    }];
}

- (void)goToSearchResultViewController:(NSMutableArray *)hospital{
    SearchResultViewController *vc = (SearchResultViewController *)[SearchResultViewController instanceFromStoryboardName:@"Home"];
    vc.hospitalList = hospital;
    [self.navigationController pushViewController:vc animated:true];
}

- (IBAction)searchButtonPressed:(id)sender {
    NSString *city = self.cityPicker.selectedItem;
    NSString *district = self.districPicker.selectedItem;
    if ([district isEqualToString:@"Tất cả Quận/Huyện"]) {
        [self searchHospitalByCity:city];
    }else {
        [self searchHospital: city district:district];
    }
}

@end
