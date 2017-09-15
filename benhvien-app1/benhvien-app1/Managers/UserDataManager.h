//
//  UserDataManager.h
//  benhvien-app1
//
//  Created by 507-8 on 9/15/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSUSerDefaults+Utility.h"

@interface UserDataManager : NSObject

@property (strong, nonatomic)NSString *accessToken;
@property (strong, nonatomic)NSString *userId;
@property (strong, nonatomic)NSString *role;
@property (strong, nonatomic)NSString *email;
@property (strong, nonatomic)NSString *city;
@property (strong, nonatomic)NSString *fullName;

+ (instancetype)sharedClient;
- (void)setUserData:(NSDictionary *)data ;
- (void)clearUserData;

@end
