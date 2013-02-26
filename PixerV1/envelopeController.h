//
//  envelopController.h
//  PixerV1
//
//  Created by jitu keshri on 11/20/12.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"


@interface envelopController : UIViewController<UIScrollViewDelegate>
{

    IBOutlet UILabel *horizontalBtmBarLbl;
    
    IBOutlet UILabel *verticalBtmBarLbl1;
    
    IBOutlet UILabel *verticalBtmBarLbl2;
    
    IBOutlet UILabel *verticalBtmBarLbl3;

    IBOutlet UILabel *toLabel;
    
    IBOutlet UILabel *nameLabel;
    
    IBOutlet UILabel *countryLabel;
    
    IBOutlet UILabel *fromLabel;
    
    IBOutlet UILabel *fmLabel;
    
    IBOutlet UIView *envelopeView;
    
    IBOutlet UIImageView *recievedImageView;
    
    IBOutlet UIView *recievedImageSubView;
    
    IBOutlet UIView *recievedImageMapView;
    
    NSArray *detailsArray;
    
    UILabel *label;
    
    UITableViewCell *cell;
    
    NSString *text;
    
    CGSize constraint;
    
    CGSize size;
    
    MapAnnotation *annotation;
    


    
}
@property (strong, nonatomic) IBOutlet UITableView *imageDetailsTable;

@property (strong, nonatomic) IBOutlet MKMapView *mymap;

- (IBAction)inboxbtn:(id)sender;

- (IBAction)reply:(id)sender;

- (IBAction)archivebtn:(id)sender;

- (IBAction)settingbtn:(id)sender;

- (IBAction)openEnvelope:(id)sender;

- (IBAction)openEnvelopeInOtherWay:(id)sender;




- (IBAction)infobtn:(id)sender;

- (IBAction)goBack:(id)sender;



@end
