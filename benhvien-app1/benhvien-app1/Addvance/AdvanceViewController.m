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

@interface AdvanceViewController ()<IQDropDownTextFieldDelegate>

@end

@implementation AdvanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tìm kiếm nâng cao";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpUserInterface {
    [self showBackButton];
    _cityContentView.layer.cornerRadius =4.0;
    _cityContentView.layer.borderWidth = 0.5;
    _cityContentView.layer.borderColor = [UIColor colorWithHex:0xC87CC].CGColor;
    _districContentView.layer.cornerRadius =4.0;
    _districContentView.layer.borderWidth = 0.5;
    _districContentView.layer.borderColor = [UIColor colorWithHex:0xC87CC].CGColor;
    _findButton.layer.cornerRadius = 4.0;
    _cities =  [self readCitiesFromFile];
    _cityPicker.delegate = self;
    _districPicker.delegate = self;
    [self setupDistrictDropDowm];
}

-(NSMutableArray *)readCitiesFromFile {
    NSMutableArray *cities = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"json" ];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *cityArray = [jsonDict objectForKey:@"cities"];
    for (NSDictionary *cityData in cityArray){
        City *city = [City initWithData:cityData];
        [cities addObject:city];
    }
    return cities;
}

-(NSArray *)getCityNames {
    NSMutableArray *cityName = [NSMutableArray new];
    for(City *city in _cities){
        [cityName addObject:city.name];
    }
    return [cityName mutableCopy];
}

- (NSArray *)getDistrictNameFromCity:(City *)city {
    NSMutableArray *districtName = [NSMutableArray new];
    [districtName addObjectsFromArray:city.district];
    [districtName insertObject:@"Tat ca Quan/Huyen" atIndex:0];
    return [districtName mutableCopy];
}
- (void)setupDistrictDropDowm {
   self.cityPicker.isOptionalDropDown = NO;
    [self.cityPicker setItemList:[self getCityNames]];
    City *selectCity = (City *)_cities[0];
    self.cityPicker.isOptionalDropDown = NO;
    [self.districPicker setItemList:[self getDistrictNameFromCity:selectCity]];
    [self.districPicker setSelectedRow:0];
}

- (void)textField:(IQDropDownTextField *)textField didSelectItem:(NSString *)item{
    NSInteger selectIndex = textField.selectedRow;
    if(textField == _cityPicker) {
        City *city = _cities[selectIndex];
        [self.districPicker setItemList:[self getDistrictNameFromCity:city]];
        [self.districPicker setSelectedRow:0];
    }else {
        
    }
}

- (IBAction)findBtn:(id)sender {
    SearchResultViewController *vc = (SearchResultViewController *)[SearchResultViewController instanceFromStoryboardName:@"Home"];
    [self.navigationController pushViewController:vc animated:true];
}
@end
