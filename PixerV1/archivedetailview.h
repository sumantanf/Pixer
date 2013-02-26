//
//  archivedetailview.h
//  pixer
//
//  Created by jitu keshri on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface archivedetailview : UIViewController
{


    IBOutlet UIImageView *expimage;
    
    IBOutlet UIImageView *archiveimg;
    
    

    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
    
}
@property (nonatomic) int val;

@property (nonatomic,strong) NSMutableArray *imagesArray;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)infobtn:(id)sender;

- (IBAction)gotoexpandedview:(id)sender;


@end
