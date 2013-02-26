//
//  openingscreen.h
//  PixerV1
//
//  Created by jitu keshri on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface openingscreen : UIViewController
{
    
    
    IBOutlet UIImageView *expimage;
    
    IBOutlet UILabel *horizontalBtmBarLbl;

    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;

    IBOutlet UILabel *verticalBtmBarLbl3;
    
}
@property (nonatomic) int val;

@property (nonatomic,strong) NSMutableArray *imagesArray;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)infobtn:(id)sender;


@end
