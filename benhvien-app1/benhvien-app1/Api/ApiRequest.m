//
//  ApiRequest.m
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "ApiRequest.h"


@implementation ApiRequest

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"email": email,
                                 @"password": password,
                                 };
    [[ApiManager shareClient] requestApiWithEndpoint:Login method:POST parameters:parameters hasAuth:false completion:completion];
}

+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiCompletionBlock)completion{
    NSDictionary *parameters = @{@"name": name};
    [[ApiManager shareClient] requestApiWithEndpoint:SearchByName  method:GET parameters:parameters hasAuth:true completion:completion];

}

+ (void)getHospitalCompletionBlock:(ApiCompletionBlock)completion{
    [[ApiManager shareClient] requestApiWithEndpoint:Cities
                                              method:GET
                                          parameters:[NSDictionary new]
                                             hasAuth:true
                                          completion:completion];
}

+ (void)searchHospitalByCityandDistrict:(NSString *)city district:(NSString *)district page:(NSInteger )page completionBlock:(ApiCompletionBlock)completion {
    
    NSDictionary *parameters = @{@"city":city,
                                 @"district":district,
                                 @"page":@(page)};
    [[ApiManager shareClient]requestApiWithEndpoint:SearchByNameandDistrict method:GET parameters:parameters hasAuth:true completion:completion];
}

+ (void)searchHospitalByCity:(NSString *)city page:(NSInteger)page completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *paramenters = @{@"city":city,
                                  @"page":@(page)};
    [[ApiManager shareClient] requestApiWithEndpoint:SearchHospitalCity method:GET parameters:paramenters hasAuth:true completion:completion];
}

+ (void)getHospitalInfo:(NSString *)hospitalId completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *paramenters = @{@"id":hospitalId};
    [[ApiManager shareClient] requestApiWithEndpoint:HospitalInfo method:GET parameters:paramenters hasAuth:true
                                          completion:completion];
}

+ (void)registerUser:(NSString *)email password:(NSString *)passaword city:(NSString *)city fullname:(NSString *)fullname completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *paramenters = @{@"email":email,
                                  @"password":passaword,
                                  @"role":@"email",
                                  @"city":city,
                                  @"fullName":fullname};
    [[ApiManager shareClient] requestApiWithEndpoint:Register method:POST parameters:paramenters hasAuth:false completion:completion];
}

+ (void)changePasswordWithUserId:(NSString *)userId oldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"password":oldPassword,
                                 @"newPassword":newPassword,
                                 @"id":userId};
    [[ApiManager shareClient] requestApiWithEndpoint:ChangePassEndPoint
                                              method:PUT
                                          parameters:parameters
                                             hasAuth:true
                                          completion:completion];
}

@end
