//
//  Hospital.h
//  
//
//  Created by 507-8 on 7/31/17.
//
//

#import <Foundation/Foundation.h>
#import "ApiResponse.h"

@interface Hospital : NSObject

@property (strong,nonatomic) NSString *hospitalId;

@property (strong,nonatomic) NSString *avatar ;

@property (strong, nonatomic) NSString *city;

@property (strong, nonatomic) NSString *hospitalDescipton;

@property (strong,nonatomic) NSString *district;

@property (strong, nonatomic) NSArray *images;

@property (nonatomic) double latitude;

@property (nonatomic) double longtitude;

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSArray *phones;

@property (strong, nonatomic) NSString *street;

@property (strong, nonatomic) NSDictionary *response;

+(instancetype)initWithResponse:(NSDictionary *)response;

@end
