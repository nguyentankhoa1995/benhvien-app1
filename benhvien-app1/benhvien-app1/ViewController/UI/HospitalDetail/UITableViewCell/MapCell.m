//
//  MapCell.m
//  benhvien-app1
//
//  Created by 507-8 on 8/21/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "MapCell.h"
#import "Hospital.h"
#import "MapModel.h"

@implementation MapCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCell:(id)model {
    MapModel *hos = (MapModel *)model;
    if(hos) {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:hos.latitude longitude:hos.longtitude zoom:15];
        
        GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        
        GMSMarker *marker = [GMSMarker new];
        marker.position = CLLocationCoordinate2DMake(hos.latitude, hos.longtitude);
        [marker setAppearAnimation:kGMSMarkerAnimationPop];
        marker.icon = [UIImage imageNamed:@"flag_icon"];
        marker.map = mapView;
       self.MapView = mapView;
    }
}
@end
