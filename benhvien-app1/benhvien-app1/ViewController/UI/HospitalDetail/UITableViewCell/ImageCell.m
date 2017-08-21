//
//  ImageCell.m
//  benhvien-app1
//
//  Created by 507-8 on 8/21/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "ImageCell.h"
#import "ImageModel.h"

@interface ImageCell()<KASlideShowDelegate,KASlideShowDataSource>
{
    NSMutableArray *datasource;
}
@end

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self setupSlideShow:datasource];
    });
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCell:(id)model {
    ImageModel *imageModel = (ImageModel *)model;
    if (imageModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupSlideShow:imageModel.images];
        });
    }
}

- (void)setupSlideShow:(NSArray *)images {
    datasource = [images mutableCopy];
    datasource = [NSMutableArray new];
    for (NSString *url in images) {
        [datasource addObject:[NSURL URLWithString:url]];
    }
   
    _slideShow.datasource = self;
    _slideShow.delegate = self;
    [_slideShow setDelay:2];
    [_slideShow setTransitionDuration:1];
    [_slideShow setTransitionType:KASlideShowTransitionSlideHorizontal];
    [_slideShow setImagesContentMode:UIViewContentModeScaleAspectFill];
    [_slideShow start];
}

#pragma mark - KASlideShow datasource

- (NSObject *)slideShow:(KASlideShow *)slideShow objectAtIndex:(NSUInteger)index
{
    return datasource[index];
}

- (NSUInteger)slideShowImagesNumber:(KASlideShow *)slideShow
{
    return datasource.count;
}

@end
