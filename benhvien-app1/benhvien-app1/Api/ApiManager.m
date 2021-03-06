//
//  ApiManager.m
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "ApiManager.h"
#import "UserDataManager.h"


@interface ApiManager()
{


}

@property (strong, nonatomic) AFHTTPSessionManager *manager ;

@end

@implementation ApiManager

//khoi tao mot singleton
+ (instancetype)shareClient {
    static ApiManager *_sharedClient =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ApiManager alloc] init];
        [_sharedClient setupManger];
    });
    return  _sharedClient;
}

- (void)setupManger {
    self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
}

- (void)setUpHeader {
    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self.manager.requestSerializer setValue:[self getAccessToken] forHTTPHeaderField:@"Authorization"];
}

- (NSString *)getAccessToken {
    NSString *token = [NSString stringWithFormat:@"JWT %@",[UserDataManager sharedClient].accessToken];
    return token;
}

- (void)requestApiWithEndpoint:(NSString *)enpoint method:(ApiMethod)method parameters:(NSDictionary *)parameters hasAuth:(BOOL)hasAuth completion:(ApiCompletionBlock)completion {
    NSString *fullURL = [NSString stringWithFormat:@"%@%@", BaseURL, enpoint];
    NSLog(@"URL: %@", fullURL);
    if (hasAuth){
        [self setUpHeader];
    }
    switch (method) {
        case GET: {
            [self processGetRequestWith:fullURL parameters:parameters completion:completion];

            break;
        }
        case POST: {
            [self processPostRequestWith:fullURL parameters:parameters completion:completion];
            break;
        }
        case PUT: {
            [self processPutRequestWith:fullURL parameters:parameters completion:completion];
            break;
        }
        default:
            break;
    }
}

#pragma mark - GET

- (void)processGetRequestWith:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiCompletionBlock)completion {
    
    [self.manager GET:url
           parameters:parameters
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  [self processSuccessWithResponse:responseObject completion:completion];
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  [self processFailureWithError:error completion:nil];
              }];
}

#pragma mark - POST

- (void)processPostRequestWith:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiCompletionBlock)completion {
    [self.manager POST:url
           parameters:parameters
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  [self processSuccessWithResponse:responseObject completion:completion];
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  [self processFailureWithError:error completion:nil];
                  
              }];
}

#pragma mark - PUT

- (void)processPutRequestWith:(NSString *)url parameters:(NSDictionary *)parameters completion:(ApiCompletionBlock)completion {
    [self.manager PUT:url
            parameters:parameters
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   
                   [self processSuccessWithResponse:responseObject completion:completion];
                   
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   
                   [self processFailureWithError:error completion:nil];
                   
               }];
}


#pragma mark - SUCCESS

- (void)processSuccessWithResponse:(id)responseObject completion:(ApiCompletionBlock)completion {
    NSLog(@"Success with response: %@",responseObject);
    ApiResponse *res = [ApiResponse initWithResponse: responseObject ];
    if(completion) {
        completion(res , nil);
    }
}

#pragma mark - FAILURE

- (void)processFailureWithError:(NSError *)error completion:(ApiCompletionBlock)completion {
    if(completion) {
          completion(nil, error);
      }
    NSLog(@"Failure with response: %@",error);
}

@end
