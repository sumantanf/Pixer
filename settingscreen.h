//
//  settingscreen.h
//  pixer
//
//  Created by jitu keshri on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingscreen : UIViewController

{
   
    IBOutlet UIImageView *login;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    IBOutlet UIButton *loginbtn;
    
    IBOutlet UIButton *registerbtn;
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
    
}
- (IBAction)registerbtn:(id)sender;

- (IBAction)loginbtn:(id)sender;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;



@end
