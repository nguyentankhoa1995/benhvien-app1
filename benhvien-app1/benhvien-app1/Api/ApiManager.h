//
//  ApiManager.h
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "ApiResponse.h"
#import "ApiEndpoint.h"

typedef enum {
    GET,
    POST,
    PUT
} ApiMethod;

typedef void (^ApiCompletionBlock)(ApiResponse *response, NSError *error);//nhu 1 ham kieu tra ve la kieu void

@interface ApiManager : NSObject

+ (instancetype)shareClient;

- (void)requestApiWithEndpoint:(NSString *)enpoint method:(ApiMethod)method parameters:(NSDictionary *)parameters hasAuth:(BOOL)hasAuth completion:(ApiCompletionBlock)completion;

@end
