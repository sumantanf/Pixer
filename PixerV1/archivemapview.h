//
//  archivemapview.h
//  pixer
//
//  Created by jitu keshri on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface archivemapview : UIViewController
{



    
    IBOutlet UIImageView *archiveimg;
    
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
    
    NSArray *detailsArray;
    
    UILabel *label;
    
    UITableViewCell *cell;
    
    NSString *text;
    
    CGSize constraint;
    
    CGSize size;

    
}



@property (strong, nonatomic) IBOutlet MKMapView *mymap;

@property (strong, nonatomic) IBOutlet UITableView *imageDetailsTable;


- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)goBack:(id)sender;

@end
