//
//  envelopeController.m
//  PixerV1
//
//  Created by jitu keshri on 11/20/12.
//
//

#define FONT_SIZE 12.0f
#define CELL_CONTENT_WIDTH 223.0f
#define CELL_CONTENT_MARGIN 5.0f

#import "envelopeController.h"
#import "UIColor+HexaString.h"
#import "ViewController.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "flipSideController.h"


@interface envelopController ()

@end

@implementation envelopController
@synthesize mymap;



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
    //MapControls
    
    mymap.delegate=self;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.02;
    span.longitudeDelta=0.02;
    
    CLLocationCoordinate2D location;
    
    
    
    location.latitude=17.42891;
    location.longitude=78.429781;
    
    region.span=span;
    region.center=location;
    
    
    annotation = [[MapAnnotation alloc] initWithCoordinate:location];
    
    [mymap addAnnotation:annotation];
    
    [mymap setRegion:region animated:TRUE];
    
    annotation=nil;

    
    // Do any additional setup after loading the view from its nib.
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    
    /* Code To Tilt UILabel*/
    toLabel.transform= CGAffineTransformMakeRotation(-M_PI/40 );
    nameLabel.transform = CGAffineTransformMakeRotation(-M_PI/40 );
    countryLabel.transform=CGAffineTransformMakeRotation( -M_PI/40 );
    fromLabel.transform=CGAffineTransformMakeRotation( -M_PI/40 );
    fmLabel.transform=CGAffineTransformMakeRotation( -M_PI/25 );
     
    [toLabel setTextColor:[UIColor colorWithHexString:@"2e3f92"]];
    [nameLabel setTextColor:[UIColor colorWithHexString:@"2e3f92"]];
    [countryLabel setTextColor:[UIColor colorWithHexString:@"2e3f92"]];
    [fromLabel setTextColor:[UIColor colorWithHexString:@"2e3f92"]];
    [fmLabel   setTextColor:[UIColor colorWithHexString:@"2e3f92"]];
     
    detailsArray=[[NSArray alloc]init];
    
    NSArray *arr=[[NSArray alloc]initWithObjects:
                  @"WHO:\nParser Ram",
                  @"WHERE:\nMt Abu, INDIA",
                  @"WHEN:\nAugust 22, 2012. 5:23 P.M",
                  @"WHAT:\nA moment when the residents of the small hamlet return home",nil];
    
    detailsArray=arr;
    
    arr=nil;
    
    
    
       
    
    
}

#pragma UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return detailsArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    text = [detailsArray objectAtIndex:[indexPath row]];
    
    constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
            constrainedToSize:constraint
                lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height, 15.0f);
    
    return height + (CELL_CONTENT_MARGIN * 2);
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    NSString *identifier=@"StaticIdetifier";
    
    cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    label = nil;
    
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]
              initWithStyle:UITableViewCellStyleDefault
              reuseIdentifier:identifier];
        
        label =[[UILabel alloc] initWithFrame:CGRectZero];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setMinimumFontSize:FONT_SIZE];
        [label setNumberOfLines:6];
        [label setFont:[UIFont fontWithName:@"Futura" size:10]];
        [label setTextColor:[UIColor colorWithHexString:@"5a5a5a"]];
        [label setTag:1];
        
        [[cell contentView] addSubview:label];
    }
    
    text = [detailsArray objectAtIndex:[indexPath row]];
    
    constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE]
            constrainedToSize:constraint
                lineBreakMode:UILineBreakModeWordWrap];
    
    if (!label)
        
        label = (UILabel*)[cell viewWithTag:1];
    
    [label setText:text];
    
    [label setFrame:
     CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN,
                CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2),
                MAX(size.height, 15.0f))];
    
    
    return cell;
    
    
    
}


- (IBAction)infobtn:(id)sender
{
    

    [recievedImageSubView removeFromSuperview];
    [envelopeView addSubview:recievedImageMapView];
    
    
   
}

- (IBAction)goBack:(id)sender
{
    [recievedImageMapView removeFromSuperview];
    [envelopeView addSubview:recievedImageSubView];
}




- (void)viewDidUnload
{
    toLabel = nil;
    nameLabel = nil;
    countryLabel = nil;
    fromLabel = nil;
    fmLabel = nil;
    envelopeView = nil;
    recievedImageView = nil;
    recievedImageSubView = nil;
    recievedImageMapView = nil;
    horizontalBtmBarLbl=nil;
    
    verticalBtmBarLbl1=nil;
    
    verticalBtmBarLbl2=nil;
    
    verticalBtmBarLbl3=nil;
    
    toLabel=nil;
    
    nameLabel=nil;
    
    countryLabel=nil;
    
    fromLabel=nil;
    
    fmLabel=nil;
    
    envelopeView=nil;
    
    recievedImageView=nil;
    
    recievedImageSubView=nil;
    
    recievedImageMapView=nil;
    
    detailsArray=nil;
    
    label=nil;
    
    cell=nil;
    
    text=nil;
    
    annotation=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)inboxbtn:(id)sender {
    
    ViewController *vc=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:NO];
    
    
}

- (IBAction)reply:(id)sender {
    
    sentcontroller *sentscr=[[sentcontroller alloc]initWithNibName:@"sentcontroller" bundle:nil];
    
    [self.navigationController pushViewController:sentscr animated:NO];
    
    
}

- (IBAction)archivebtn:(id)sender{
    archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
    
    [self.navigationController pushViewController:arcscreen animated:NO];
    
}

- (IBAction)settingbtn:(id)sender {
    
    
    
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    
    [self.navigationController pushViewController:setscreen animated:NO];
    
    
}

- (IBAction)openEnvelope:(id)sender
{
    
    [UIView transitionWithView:envelopeView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        
                        
                        [envelopeView addSubview:recievedImageSubView];
                        
                        
                    } completion:nil];
  
}

- (IBAction)openEnvelopeInOtherWay:(id)sender
{
    [UIView transitionWithView:envelopeView
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromLeft                    animations:^{
                        
                        
                        [envelopeView addSubview:recievedImageSubView];
                        
                        
                    } completion:nil];

    
    
}

-(void)viewDidDisappear:(BOOL)animated
{

    horizontalBtmBarLbl=nil;
    
    verticalBtmBarLbl1=nil;
    
    verticalBtmBarLbl2=nil;
    
    verticalBtmBarLbl3=nil;
    
    toLabel=nil;
    
    nameLabel=nil;
    
    countryLabel=nil;
    
    fromLabel=nil;
    
    fmLabel=nil;
    
    envelopeView=nil;
    
    recievedImageView=nil;
    
    recievedImageSubView=nil;
    
    recievedImageMapView=nil;
    
    detailsArray=nil;
    
    label=nil;
    
    cell=nil;
    
    text=nil;
           
    annotation=nil;

    
    
}

@end
