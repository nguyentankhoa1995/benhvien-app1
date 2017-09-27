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

- (void)configureCell:(Hospital *)hospital {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:hospital.latitude longitude:hospital.longtitude zoom:15];
    _MapView.camera = camera;
    _MapView.myLocationEnabled = false;
    
    CLLocationCoordinate2D postion = CLLocationCoordinate2DMake(hospital.latitude, hospital.longtitude);
    GMSMarker *marker = [GMSMarker markerWithPosition:postion];
    marker.map = self.MapView;
}
@end
