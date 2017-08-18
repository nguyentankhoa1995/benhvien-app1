//
//  Hospital.m
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import "Hospital.h"


@implementation Hospital 

+ (instancetype)initWithResponse:(NSDictionary *)response {
    Hospital *res = [[Hospital alloc] init];
    [res parsenResponse:response];
    return res;
}

- (void)parsenResponse:(NSDictionary *)response {
    NSString *hospitalId = [response objectForKey:@"_id"];
    if (hospitalId && ![hospitalId isKindOfClass:[NSNull class]]) {
        self.hospitalId = @"";
    }
    
    NSString *avatar = [response objectForKey:@"avatar"];
    if (avatar && ![avatar isKindOfClass:[NSNull class]]) {
        self.avatar = avatar;
    }else {
        self.avatar = @"";
    }
    
    NSString *city = [response objectForKey:@"city"];
    if (city  && ![city isKindOfClass:[NSNull class]]) {
        self.city = city;
    }else {
        self.city = @"";
    }
    
    NSString *hospitalDescription = [response objectForKey:@"description"];
    if (hospitalDescription && ![hospitalDescription isKindOfClass:[NSNull class]]) {
        self.hospitalDescipton = hospitalDescription;
    }else {
        self.hospitalDescipton = @"";
    }
    
    NSString *district = [response objectForKey:@"district"];
    if (district  && ![district isKindOfClass:[NSNull class]]) {
        self.district = district;
    }else {
        self.district = @"";
    }
    
    NSArray *images = [response objectForKey:@"images"];
    if (images  && ![images isKindOfClass:[NSNull class]]) {
        self.images = images;
    }else {
        self.images = [NSArray new];
    }
    
    NSString *name = [response objectForKey:@"name"];
    if (name  && ![name isKindOfClass:[NSNull class]]) {
        self.name  = name;
    }else {
        self.name = @"";
    }
    
    NSArray *phones = [response objectForKey:@"phones"];
    if (phones  && ![phones isKindOfClass:[NSNull class]]) {
        self.phones = phones;
    }else {
        self.phones = [NSArray new];
    }
    
    NSNumber *latitude = [response objectForKey:@"latitude"];
    if (latitude  && ![latitude isKindOfClass:[NSNull class]]) {
        self.latitude = [latitude doubleValue];
    }
    
    NSNumber *longtitude = [response objectForKey:@"longtitude"];
    if (longtitude  && ![longtitude isKindOfClass:[NSNull class]]) {
        self.longtitude = [longtitude doubleValue];
    }
    
    NSString *street = [response objectForKey:@"street"];
    if (street  && ![street isKindOfClass:[NSNull class]]) {
        self.street = street;
    }else {
        self.street = @"";
    }
}

@end
