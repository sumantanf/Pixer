//
//  archiveImagedetailview.h
//  PixerV1
//
//  Created by pravasis on 12/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface archiveImagedetailview : UIViewController
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
}
@property (strong, nonatomic) IBOutlet UIImageView *detailimageview;
@property (nonatomic,strong) NSMutableArray *imagesArray;
@property (nonatomic) int val;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;



@end
