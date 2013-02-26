//
//  archive.h
//  pixer
//
//  Created by jitu keshri on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface archive : UIViewController
{
  
    IBOutlet UIImageView *archiveimg;

    IBOutlet UIScrollView *gridscrollview;

    IBOutlet UIImageView *scrbg;
    IBOutlet UILabel *hd1;
    IBOutlet UILabel *hd2;
    
    
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
    
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
    
    
    UIImageView *verticalLine;
    UIImageView *horizontalLine;
    UIImageView *image;
    UIImageView *postImage;
    UILabel *cfrom;
    UIButton *button;
    
    NSMutableArray *cnames;
    NSMutableArray *imgarr;
    
}
@property (nonatomic,strong) NSMutableArray *imagesArray;
@property  (nonatomic ,strong)NSMutableArray *countryarr;
-(void)addPopup:(id)sender;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;
@end
