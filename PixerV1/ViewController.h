//
//  ViewController.h
//  pixer
//
//  Created by jitu keshri on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

{
    IBOutlet UITableView *tblinbox;

    IBOutlet UIImageView *inbox;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;
   
    IBOutlet UIImageView *inboxIcon;
    
    IBOutlet UIImageView *replyIcon;
    
    IBOutlet UIImageView *saveIcon;
    
    IBOutlet UIImageView *settingsIcon;
    
    UITableViewCell *cell;
    
    
    
    UIImageView *imageView;
    UILabel *headerlbl;
    UILabel *horizontalline;
    UILabel *verticalline;
    UIImageView *flagiv;
    UILabel *locationtxt;
    
    
    
    IBOutlet UIButton *inboxButton;
    
    
    UIImageView *imgView;
    UILabel *headlbl;
    UILabel *horlbl;
    UILabel *verlbl;
    UIImageView *fview;
    UILabel *lotxt;
    

    
}

@property (nonatomic,strong) NSMutableArray *tabledata;
@property (nonatomic ,strong) NSMutableArray *flagarray;
@property (nonatomic,strong) NSMutableArray *locarray;


- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;


@end
