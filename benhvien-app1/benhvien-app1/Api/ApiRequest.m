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
    [[ApiManager shareClient] requestApiWithEndpoint:Login method:POST parameters:parameters completion:completion];
}

+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiCompletionBlock)completion{
    NSDictionary *parameters = @{@"name": name};
    [[ApiManager shareClient] requestApiWithEndpoint:SearchByName  method:GET parameters:parameters completion:completion];

}

+ (void)getHospitalCompletionBlock:(ApiCompletionBlock)completion{
    [[ApiManager shareClient] requestApiWithEndpoint:Cities
                                              method:GET
                                          parameters:[NSDictionary new]
                                          completion:completion];
}

+ (void)searchHospitalByCityandDistrict:(NSString *)city district:(NSString *)district completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"city":city,
                               @"district":district,
                               };
    [[ApiManager shareClient]requestApiWithEndpoint:SearchByNameandDistrict method:GET parameters:parameters completion:completion];
}

+ (void)searchHospitalByCity:(NSString *)city completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *paramenters = @{@"city":city};
    [[ApiManager shareClient] requestApiWithEndpoint:SearchHospitalCity method:GET parameters:paramenters completion:completion];
}

+ (void)getHospitalInfo:(NSString *)hospitalId completionBlock:(ApiCompletionBlock)completion {
    NSDictionary *paramenters = @{@"id":hospitalId};
    [[ApiManager shareClient] requestApiWithEndpoint:HospitalInfo method:GET parameters:paramenters completion:completion];
}


@end
