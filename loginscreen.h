//
//  loginscreen.h
//  PixerV1
//
//  Created by jitu keshri on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginscreen : UIViewController
{
    
    IBOutlet UILabel *reglbl;
    
    IBOutlet UIImageView *login;
    
              
    IBOutlet UILabel *lbluser;
    
    IBOutlet UILabel *lblpass;
    
    IBOutlet UILabel *lgwithfb;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
}

@property (strong, nonatomic) IBOutlet UITextField *uname;
@property (strong, nonatomic) IBOutlet UITextField *pword;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)setlogin:(id)sender;


@end
