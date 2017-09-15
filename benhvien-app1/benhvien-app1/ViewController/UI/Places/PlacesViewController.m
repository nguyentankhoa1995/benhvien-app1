//
//  PlacesViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 9/11/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "PlacesViewController.h"
#import "PlacesTableViewCell.h"

@interface PlacesViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITextField *searchTextField;
    HNKGooglePlacesAutocompleteQuery *query;
    NSArray *searchResult;
    
}
@end

@implementation PlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    query = [HNKGooglePlacesAutocompleteQuery sharedQuery];
    searchResult = [NSArray new];
    self.placesTableView.delegate = self;
    self.placesTableView.dataSource = self;
//   self.placesTableView.estimatedRowHeight = 44.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setUpUserInterface {
//    self.title = @"Đăng nhập";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Huỷ bỏ" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonPressed:)];
    
    searchTextField = [self searchBox];
    UIView *wrapperView = [[UIView alloc]initWithFrame:searchTextField.frame];
    [wrapperView addSubview:searchTextField];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:wrapperView];
    self.navigationItem.rightBarButtonItems = @[searchButton,cancelButton ];
}

- (UITextField *)searchBox {
    CGFloat srceenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat textFieldWidth = (280.0/375.0) * srceenWidth ;
    UITextField *searchCityTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, textFieldWidth, 35.0)];
        searchCityTextField.borderStyle = UITextBorderStyleNone;
        searchCityTextField.layer.borderWidth = 0.5;
        searchCityTextField.layer.cornerRadius = 4.0;
        searchCityTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        searchCityTextField.layer.backgroundColor = [UIColor whiteColor].CGColor;
        searchCityTextField.font = [UIFont systemFontOfSize:15.0];
        searchCityTextField.placeholder = @"Tỉnh/Thành Phố";
        searchCityTextField.delegate = self;
    return searchCityTextField;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *searchText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [query fetchPlacesForSearchQuery:searchText completion:^(NSArray *places, NSError *error){
        if (error) {
            NSLog(@"ERROR:%@",error);
        }else {
                searchResult = places;
                [_placesTableView reloadData];
            }
        }
     ];
    return  true;
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.view endEditing:true];
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Xác nhận"
                                         message:@"Bạn có chắc chắn muốn huỷ bỏ?"
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Yes"
                               otherButtonTitles:nil
                                        tapBlock:^(UIAlertController *controller, UIAlertAction *action, NSInteger buttonIndex){
                                            if (buttonIndex == controller.cancelButtonIndex) {
                                                
                                            } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                [self.navigationController dismissViewControllerAnimated:true completion:nil];
                                            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                
                                            }
                                        }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return searchResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableViewCell  *cell = (PlacesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    HNKGooglePlacesAutocompletePlace *data = searchResult[indexPath.row];
    cell.cityNameLabel.text = data.name;
    return cell;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.onDidSelect) {
        HNKGooglePlacesAutocompletePlace *data = searchResult[indexPath.row];
        self.onDidSelect(data.name , self);
    }
}

@end
