//
//  ApiResponse.m
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "ApiResponse.h"

@implementation ApiResponse

+(instancetype)initWithResponse:(NSDictionary *)response {
    ApiResponse *res = [[ApiResponse alloc] init];
    [res parsenResponse:response];
    return res;
}

- (void)parsenResponse:(NSDictionary *)response {
    NSString *message = [response objectForKey:@"message"];
    if ([message isKindOfClass:[NSNull class]]) {
        self.message = @"";
    }else {
        self.message = message;
    }
    
    NSNumber *success = [response objectForKey:@"success"];
    if (success) {
        self.success = [success boolValue];
    }
    
    self.data = [response objectForKey:@"data"];
    self.originalResponse = response;
}

@end
