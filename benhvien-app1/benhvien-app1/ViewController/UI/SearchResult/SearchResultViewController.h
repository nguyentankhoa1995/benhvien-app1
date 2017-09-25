//
//  SearchResultViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//


#import "BaseViewController.h"
#import <SVPullToRefresh/SVPullToRefresh.h>
#import "Constants.h"

@interface SearchResultViewController : BaseViewController

@property (nonatomic)NSInteger currentPage;
@property (nonatomic)NSInteger totalPage;
@property (strong, nonatomic)NSString *dictrist;
@property (strong, nonatomic)NSString *city;
@property (nonatomic)SearchType type;
@property (strong,nonatomic) NSMutableArray *hospitalList;
@property (weak, nonatomic) IBOutlet UITableView *resultTableView;

@end
