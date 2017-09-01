//
//  DirectionViewController.m
//  benhvien-app1
//
//  Created by 507-8 on 8/25/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "DirectionViewController.h"
#import <OCGoogleDirectionsAPI/OCGoogleDirectionsAPI.h>

@interface DirectionViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentLocation;
}
@end

@implementation DirectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    [self showBackButton];
    self.title = self.hospital.name;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getCurrentLocation];
}

- (void)getCurrentLocation {
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
}

- (void)drawDirectionPathWithOriginLocation:(CLLocation *)origin destinationLocation:(CLLocation *)destination {
    OCDirectionsRequest *request = [OCDirectionsRequest requestWithOriginLocation:origin andDestinationLocation:destination];
    OCDirectionsAPIClient *client = [OCDirectionsAPIClient new];
    [self showHUD];
    [client directions:request response:^(OCDirectionsResponse *response, NSError *error){
        [self hideHUD];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                return;
            }
            
            if(response.status != OCDirectionsResponseStatusOK) {
                
                return ;
            }
            
            NSArray *routesArray = response.routes;
            GMSPolyline *polyline = nil;
            if (routesArray.count > 0) {
                OCDirectionsRoute *route = [response route];
                OCDirectionsPolyline *overViewPolyline = route.overviewPolyline;
                NSString *point = overViewPolyline.points;
               
                GMSMarker *marker = [GMSMarker new];
                marker.position = CLLocationCoordinate2DMake(currentLocation.latitude, currentLocation.longitude);
                marker.appearAnimation = kGMSMarkerAnimationPop;
                marker.icon = [UIImage imageNamed:@"flag_icon"];
                marker.map = self.mapView;
                GMSPath *path = [GMSPath pathFromEncodedPath:point];
                polyline = [GMSPolyline polylineWithPath:path];
            }
            if (polyline) {
                polyline.map = _mapView;
            }
        });
    }];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    currentLocation = locations.lastObject.coordinate;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:currentLocation zoom:15.0];
    _mapView.camera = camera;
    _mapView.myLocationEnabled = true;
    [locationManager stopUpdatingLocation];
    [self drawDirectionPathWithOriginLocation:[[CLLocation alloc]initWithLatitude:currentLocation.latitude longitude:currentLocation.longitude]
                          destinationLocation:[[CLLocation alloc]initWithLatitude:_hospital.latitude longitude:_hospital.longtitude]];
}

@end
