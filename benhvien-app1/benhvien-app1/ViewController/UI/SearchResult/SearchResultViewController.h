//
//  SearchResultViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultViewController : BaseViewController

@property (strong,nonatomic) NSMutableArray *hospitalList;
@property (weak, nonatomic) IBOutlet UITableView *resultTableView;

@end
