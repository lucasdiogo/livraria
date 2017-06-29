//
//  MapaViewController.m
//  Livraria
//
//  Created by XCODE on 29/06/17.
//  Copyright © 2017 XCODE. All rights reserved.
//

#import "MapaViewController.h"

@interface MapaViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapa;



@end

@implementation MapaViewController{
    CLLocationManager * locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    locationManager.distanceFilter = 500.0;
    locationManager.headingFilter = 5.0;
    
    [locationManager requestWhenInUseAuthorization];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [locationManager startUpdatingLocation];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Core Location
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    if(locationManager.location){
        [self.mapa setRegion:MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate, 600, 800) animated:YES];
    }
}

@end
