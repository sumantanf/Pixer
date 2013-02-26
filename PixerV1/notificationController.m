//
//  notificationController.m
//  PixerV1
//
//  Created by jitu keshri on 12/20/12.
//
//

#import "notificationController.h"
#import "UIColor+HexaString.h"
#import "ViewController.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"


@interface notificationController ()

@end

@implementation notificationController
@synthesize countryLabel;
@synthesize countryLabelShadow;
@synthesize successLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    
    [successLabel setTextColor:[UIColor colorWithHexString:@"ffffff"]];
    
    [countryLabel setText:@"Colombia"];
    [countryLabelShadow setText:@"Colombia"];

    [countryLabel setTextColor:[UIColor colorWithHexString:@"ffa00c"]];
    
    [countryLabel setFont:[UIFont fontWithName:@"Futura" size:33]];
    
    [countryLabel setShadowColor:[UIColor colorWithRed:55  green:255 blue:255 alpha:0.76]];
    
    [countryLabel setShadowOffset:CGSizeMake(0,-2)];
    
    
    [countryLabelShadow setTextColor:[UIColor colorWithHexString:@"ffa00c"]];
    [countryLabelShadow setFont:[UIFont fontWithName:@"Futura" size:33]];
    [countryLabelShadow setShadowColor:[UIColor blackColor]];
    [countryLabelShadow setShadowOffset:CGSizeMake(0,1 )];


}



- (IBAction)inboxbtn:(id)sender {
    
    
    
    ViewController *vc=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    
    [self.navigationController pushViewController:vc animated:NO];
    
    
    vc=nil;
    sender=nil;
    
    
}

- (IBAction)reply:(id)sender {
    
    sentcontroller *sentscr=[[sentcontroller alloc]initWithNibName:@"sentcontroller" bundle:nil];
    
    
    [self.navigationController pushViewController:sentscr animated:NO];
    
    sentscr=nil;
    sender=nil;
}

- (IBAction)archivebtn:(id)sender {
    archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
    
    
    [self.navigationController pushViewController:arcscreen animated:NO];
    arcscreen=nil;
    sender=nil;
}

- (IBAction)settingbtn:(id)sender {
    
    
    
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    
    
    [self.navigationController pushViewController:setscreen animated:NO];
    
    setscreen=nil;
    sender=nil;
}


- (void)viewDidUnload
{
    [self setCountryLabel:nil];
    [self setSuccessLabel:nil];
    [self setCountryLabelShadow:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
