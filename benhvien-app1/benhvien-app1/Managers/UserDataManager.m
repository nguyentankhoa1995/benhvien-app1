//
//  UserDataManager.m
//  benhvien-app1
//
//  Created by 507-8 on 9/15/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "UserDataManager.h"
#import "Constants.h"

@implementation UserDataManager
@synthesize  accessToken = _accessToken;
@synthesize userId = _userId;
@synthesize role = _role;
@synthesize fullName = _fullName;
@synthesize city = _city;
@synthesize email = _email;

//cau truc tao singleton
+ (instancetype)sharedClient {
    static UserDataManager *_sharedClient = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        _sharedClient = [[UserDataManager alloc] init];
    });
    return _sharedClient;
}

- (void)clearUserData {
    [NSUserDefaults setObject:nil forKey:UserToken];
    [NSUserDefaults setObject:nil forKey:UserFullName];
    [NSUserDefaults setObject:nil forKey:UserCity];
    [NSUserDefaults setObject:nil forKey:UserId];
    [NSUserDefaults setObject:nil forKey:UserEmail];
    [NSUserDefaults setObject:nil forKey:UserRole];
}

- (void)setUserData:(NSDictionary *)data {
    self.accessToken = [data objectForKey:@"token"];
    self.userId = [data objectForKey:@"userID"];
    self.email = [data objectForKey:@"email"];
    self.role = [data objectForKey:@"role"];
    self.city = [data objectForKey:@"city"];
    self.fullName = [data objectForKey:@"fullName"];
}

- (void)setAccessToken:(NSString *)accessToken {
    _accessToken = accessToken;
    [NSUserDefaults setObject:accessToken forKey:UserToken];
}

- (NSString *)accessToken {
    NSString *accessToken = [NSUserDefaults stringForKey:UserToken];
    if (accessToken) {
        return  accessToken;
    }else {
        return @"";
    }
}

- (void)setUserId:(NSString *)userId {
    _userId = userId;
    [NSUserDefaults setObject:userId forKey:UserId];
}

- (NSString *)userId {
    NSString *userId = [NSUserDefaults stringForKey:UserId];
    if (userId) {
        return  userId;
    }else {
        return @"";
    }
}

- (void)setRole:(NSString *)role {
    _role = role;
    [NSUserDefaults setObject:role forKey:UserRole];
}

- (NSString *)role {
    NSString *role = [NSUserDefaults stringForKey:UserRole];
    if (role) {
        return  role;
    }else {
        return @"";
    }
}

- (void)setEmail:(NSString *)email {
    _email = email;
    [NSUserDefaults setObject:email forKey:UserEmail];
}

- (NSString *)email {
    NSString *email = [NSUserDefaults stringForKey:UserEmail];
    if (email) {
        return  email;
    }else {
        return @"";
    }
}

- (void)setCity:(NSString *)city {
    _city = city;
    [NSUserDefaults setObject:city forKey:UserCity];
}

- (NSString *)city {
    NSString *city = [NSUserDefaults stringForKey:UserCity];
    if (city) {
        return  city;
    }else {
        return @"";
    }
}

- (void)setFullName:(NSString *)fullName {
    _fullName = fullName;
    [NSUserDefaults setObject:fullName forKey:UserFullName];
}

- (NSString *)fullName {
    NSString *fullName = [NSUserDefaults stringForKey:UserFullName];
    if (fullName) {
        return  fullName;
    }else {
        return @"";
    }
}

@end
