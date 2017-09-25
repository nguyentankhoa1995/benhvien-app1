//
//  ApiRequest.h
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiManager.h"
#import "ApiEndpoint.h"

@interface ApiRequest : NSObject

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completionBlock:(ApiCompletionBlock)completion;
+ (void)searchHospitalByName:(NSString *)name completionBlock:(ApiCompletionBlock)completion;
+ (void)getHospitalCompletionBlock:(ApiCompletionBlock)completion;
+ (void)searchHospitalByCityandDistrict:(NSString *)city district:(NSString *)district page:(NSInteger )page completionBlock:(ApiCompletionBlock)completion;
+ (void)searchHospitalByCity:(NSString *)city page:(NSInteger)page completionBlock:(ApiCompletionBlock)completion;
+ (void)getHospitalInfo:(NSString *)hospitalId completionBlock:(ApiCompletionBlock)completion;
+ (void)registerUser:(NSString *)email password:(NSString *)passaword city:(NSString *)city fullname:(NSString *)fullname completionBlock:(ApiCompletionBlock)completion;
+ (void)changePasswordWithUserId:(NSString *)userId oldPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword completionBlock:(ApiCompletionBlock)completion;

@end
