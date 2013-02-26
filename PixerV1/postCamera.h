//
//  postCamera.h
//  PixerV1
//
//  Created by jitu keshri on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"


@interface postCamera : UIViewController<UITextFieldDelegate,UIAlertViewDelegate,UITextViewDelegate>
{
    GPUImageOutput<GPUImageInput> *filter;
    
    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;

    IBOutlet UITextView *aboutImage;
    
    IBOutlet UIView *imgView;
        
    IBOutlet UILabel *saySomthingLabel;
}


@property (nonatomic) int filterNumber;

@property (strong, nonatomic) IBOutlet UITextView *aboutImage;

@property (strong,nonatomic) GPUImagePicture *postPicture;

@property (strong,nonatomic) UIImage *imageToPost;

@property (strong, nonatomic) IBOutlet GPUImageView *postImageView;

@property (nonatomic) bool isImagePosted;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)sendToWorld:(id)sender;

-(void) setFilter:(int)filterValue;

-(void) removeAllTargets;

@end
