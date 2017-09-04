//
//  DirectionViewController.h
//  benhvien-app1
//
//  Created by 507-8 on 8/25/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hospital.h"
#import "BaseViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <OCGoogleDirectionsAPI/OCGoogleDirectionsAPI.h>

@interface DirectionViewController :BaseViewController

@property (strong,nonatomic) Hospital *hospital;
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

- (void)drawDirectionPathWithOriginLocation:(CLLocation *)origin destinationLocation:(CLLocation *)destination;

@end
