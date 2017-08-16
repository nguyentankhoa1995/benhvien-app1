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

+ (void)searchHospitalByCityandDistrict:(NSString *)city district:(NSString *)district completionBlock:(ApiCompletionBlock)completion ;

@end
