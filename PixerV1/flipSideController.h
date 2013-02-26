//
//  flipSideController.h
//  PixerV1
//
//  Created by jitu keshri on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "MapAnnotation.h"

@interface flipSideController : UIViewController
{
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    MapAnnotation *annotation;
    
    NSArray *detailsArray;
    
    UILabel *label;
    
    UITableViewCell *cell;
    
    NSString *text;
    
    CGSize constraint;
    
    CGSize size;

}
@property (strong, nonatomic) IBOutlet MKMapView *mymap;

@property (strong, nonatomic) IBOutlet UITableView *imageDetailsTable;




- (IBAction)goBack:(id)sender;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

@end
