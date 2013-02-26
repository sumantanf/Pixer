//
//  registerscreen.h
//  PixerV1
//
//  Created by jitu keshri on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerscreen : UIViewController
{
    IBOutlet UIView *bbbarbg;
    
    IBOutlet UIImageView *sendpic;
    
    IBOutlet UIImageView *inbox;
    
    IBOutlet UIImageView *archivebtn;

    IBOutlet UIImageView *login;
    
#pragma UILabels
    
    
    IBOutlet UILabel *emaillbl;
    
    IBOutlet UILabel *unamelbl;
    
    IBOutlet UILabel *passlbl;
    
    IBOutlet UILabel *cpasslbl;
    
    IBOutlet UILabel *countrylbl;
    
    IBOutlet UILabel *genderlbl;
    
    IBOutlet UILabel *disclaimerlbl;
    
    IBOutlet UILabel *reglbl;
    
    IBOutlet UILabel *discstar;
    
    IBOutlet UIScrollView *txtscrollview;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
}
@property (strong, nonatomic) IBOutlet UITextField *emailtxt;
@property (strong, nonatomic) IBOutlet UITextField *usernametxt;
@property (strong, nonatomic) IBOutlet UITextField *passwordtxt;
@property (strong, nonatomic) IBOutlet UITextField *confirmpasstxt;

@property (strong, nonatomic) IBOutlet UITextField *countrytxt;

@property (strong, nonatomic) IBOutlet UITextField *agetxt;


- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

@end
