//
//  Constants.h
//  benhvien-app1
//
//  Created by 507-8 on 9/15/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define UserToken                       @"UserToken"
#define UserId                          @"UserId"
#define UserEmail                       @"UserEmail"
#define UserRole                        @"UserRole"
#define UserCity                        @"UserCity"
#define UserFullName                    @"UserFullName"

typedef enum {
    DISTRICT,
    CITY,
    HOME
}SearchType;

typedef enum {
    LOADMORE,
    REFRESH
}LoadMode;

#endif /* Constants_h */
