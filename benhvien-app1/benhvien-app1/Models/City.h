//
//  City.h
//  benhvien-app1
//
//  Created by 507-8 on 8/14/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (strong , nonatomic) NSString *name;
@property (strong , nonatomic) NSMutableArray *district;

+ (instancetype)initWithData:(NSDictionary *)data;

@end
