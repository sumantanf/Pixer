//
//  sentcontroller.h
//  pixer
//
//  Created by jitu keshri on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface sentcontroller : UIViewController{

    
    IBOutlet UIImageView *sendpic;
    
    IBOutlet UILabel *takpic;
    
    IBOutlet UILabel *chgal;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
        
    IBOutlet UIView *activityView;
    
    IBOutlet UIView *activityBg;
    
    IBOutlet UIButton *sentButton;
        
    IBOutlet UIButton *takePic;

    IBOutlet UIButton *chGal;
    
}


- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)takepic:(id)sender;

- (IBAction)gallery:(id)sender;


@end
