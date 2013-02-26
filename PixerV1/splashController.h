//
//  splashController.h
//  PixerV1
//
//  Created by jitu keshri on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface splashController : UIViewController<CLLocationManagerDelegate>
{

    int navToNextScreen;
    NSString *selectedSpeed;
}
@property (strong, nonatomic) IBOutlet UILabel *acquiringLabel;

@property (retain, nonatomic) CLLocationManager *locationManager;

- (void)blinkAnimation:(NSString *)animationID finished:(BOOL)finished target:(UIView *)target;
-(void)pushOpeningScreen;



@end
