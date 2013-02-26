//
//  flipSideController.m
//  PixerV1
//
//  Created by jitu keshri on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#define FONT_SIZE 12.0f
#define CELL_CONTENT_WIDTH 223.0f
#define CELL_CONTENT_MARGIN 5.0f


#import "flipSideController.h"
#import "openingscreen.h"
#import "UIColor+HexaString.h"

@implementation flipSideController
@synthesize mymap;
@synthesize imageDetailsTable;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    
    
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

- (void)viewDidUnload
{
    [self setImageDetailsTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    cell=nil;
    label=nil;
    text=nil;
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    mymap=nil;
    annotation=nil;
    self.view=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goBack:(id)sender
{
    openingscreen *openingScreenController=[[openingscreen   alloc]initWithNibName:@"openingscreen" bundle:nil];
    
    [self.navigationController pushViewController:openingScreenController animated:NO];
    
    openingScreenController=nil;
    sender=nil;
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

-(void)viewDidDisappear:(BOOL)animated
{
    cell=nil;
    label=nil;
    text=nil;
    annotation=nil;
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    mymap=nil;
    self.view=nil;

}

@end
