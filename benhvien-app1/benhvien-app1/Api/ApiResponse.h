//
//  ApiResponse.h
//  benhvien-app1
//
//  Created by 507-8 on 8/4/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiResponse : NSObject

@property (strong,nonatomic) NSString *message;
@property (nonatomic) BOOL success;
@property (strong , nonatomic) id data;
@property (strong , nonatomic) NSDictionary *originalResponse;

+(instancetype)initWithResponse:(NSDictionary *)response;

- (void)parsenResponse:(NSDictionary *)responsel;

@end

//singleton la vung nho doc lap, ton tai suot qua trinh tao app, va bi huy khi kill projects 
