//
//  splashController.m
//  PixerV1
//
//  Created by jitu keshri on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "splashController.h"
#import "UIColor+HexaString.h"
#import "openingscreen.h"
#import "settingscreen.h"

@implementation splashController
@synthesize acquiringLabel;
@synthesize locationManager;



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setLocationManager:[[CLLocationManager alloc] init]];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:100.0f];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self start];

    
    navToNextScreen=1;
    self.navigationController.navigationBarHidden=YES;
    acquiringLabel.textColor=[UIColor   colorWithHexString:@"ffa800"];
    acquiringLabel.backgroundColor=[UIColor clearColor];
    [self blinkAnimation:@"blinkAnimation" finished:YES target:acquiringLabel];
    
}

-(void) start
{
    [locationManager startUpdatingLocation];
}

-(void) stop
{
    [locationManager stopUpdatingLocation];
}



- (void)blinkAnimation:(NSString *)animationID finished:(BOOL)finished target:(UIView *)target
{
    
    if (navToNextScreen!=10) 
    {
        selectedSpeed = [NSString stringWithFormat:@"0.1"];
        float speedFloat = (1.00 - [selectedSpeed floatValue]);
        
        [UIView beginAnimations:animationID context:(__bridge void *)((UILabel *)(target))];
        [UIView setAnimationDuration:speedFloat];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(blinkAnimation:finished:target:)];
        
        
        if([target alpha] == 1.0f)
            [target setAlpha:0.0f];
        else
            [target setAlpha:1.0f];
        [UIView commitAnimations];
          
        navToNextScreen++;
       
        
    }
    
    
    else
    {
        selectedSpeed=nil;
        animationID=nil;
        target=nil;
        
        [self pushOpeningScreen]; 
    }
        
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    
    
    NSLog(@"Time:%@",    newLocation.timestamp);
    NSLog(@"Latitude:%f",newLocation.coordinate.latitude);
    NSLog(@"Longitude:%f",newLocation.coordinate.longitude);
    
    [self stop];
}


-(void)pushOpeningScreen
{
    openingscreen *openScreenController=[[openingscreen alloc]
                                         initWithNibName:@"openingscreen" bundle:nil];
    [self.navigationController pushViewController:openScreenController animated:NO];
    openScreenController=nil;
    
    
//    settingscreen *settingScreenController=[[settingscreen alloc]
//                                            initWithNibName:@"settingscreen" bundle:nil];
//    [self.navigationController pushViewController:settingScreenController animated:NO];
//    settingScreenController=nil;
    
}

- (void)viewDidUnload
{
    acquiringLabel=nil;
    selectedSpeed=nil;
    self.view=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)viewDidDisappear:(BOOL)animated
{
    locationManager=nil;
    acquiringLabel=nil;
    selectedSpeed=nil;
    [self.view removeFromSuperview];
    self.view=nil;

}

@end
