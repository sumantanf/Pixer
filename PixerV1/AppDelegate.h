//
//  AppDelegate.h
//  PixerV1
//
//  Created by jitu keshri on 9/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "archivedetailview.h"
#import "openingscreen.h"
#import "splashController.h"
#import "postCamera.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CLLocationManager *locationManager;
}



@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) splashController *splashController;

@property (nonatomic ,strong ) UINavigationController *navcontroller;

@end
