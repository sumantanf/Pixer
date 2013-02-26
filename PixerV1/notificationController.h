//
//  notificationController.h
//  PixerV1
//
//  Created by jitu keshri on 12/20/12.
//
//

#import <UIKit/UIKit.h>

@interface notificationController : UIViewController
{

    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;


}

@property (strong, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) IBOutlet UILabel *countryLabelShadow;

@property (strong, nonatomic) IBOutlet UILabel *successLabel;



- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;


@end
