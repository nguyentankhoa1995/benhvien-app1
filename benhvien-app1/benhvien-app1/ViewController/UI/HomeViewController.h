//
//  HomeViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController :BaseViewController
@property (weak, nonatomic) IBOutlet UIView *searchTextField;
- (IBAction)advanceSearchButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)searchButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *advanceSearchButton;

@end
