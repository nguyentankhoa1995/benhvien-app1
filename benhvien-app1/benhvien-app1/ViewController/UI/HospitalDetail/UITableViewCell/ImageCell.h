//
//  ImageCell.h
//  benhvien-app1
//
//  Created by 507-8 on 8/21/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLTableViewCell.h"
#import <KASlideShow/KASlideShow.h>

@interface ImageCell : HLTableViewCell

@property (weak, nonatomic) IBOutlet KASlideShow *slideShow;



@end
