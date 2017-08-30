//
//  City.m
//  benhvien-app1
//
//  Created by 507-8 on 8/14/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "City.h"

@implementation City

+ (instancetype)initWithData:(NSDictionary *)data {
    City *city = [City new];
    [city parsenData:data];
    return city;
}

- (void)parsenData:(NSDictionary *)data {
    NSString *name = [data objectForKey:@"name"];
    if(name && ![name isKindOfClass:[NSNull class]]) {
        self.name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }else {
        self.name = @"";
    }
    
    NSArray *districtArray = [data objectForKey:@"districtes"];
    if (districtArray.count > 0) {
        self.district = [NSMutableArray new];
        for (NSDictionary *districtData in districtArray) {
            NSString *districName = [districtData objectForKey:@"name"];
            [self.district addObject:[districName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        }
    }else {
        self.district = [NSMutableArray new];
    }
}

@end
