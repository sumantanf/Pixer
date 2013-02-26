//
//  archivemapview.m
//  pixer
//
//  Created by jitu keshri on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define FONT_SIZE 12.0f
#define CELL_CONTENT_WIDTH 223.0f
#define CELL_CONTENT_MARGIN 5.0f


#import "archivemapview.h"
#import "MapAnnotation.h"
#import "UIColor+HexaString.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "ViewController.h"
#import "archivedetailview.h"


@implementation archivemapview
@synthesize mymap;

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
    // Do any additional setup after loading the view from its nib.
    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
#pragma Bottombar
        
    [archiveimg setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    [replyIcon setAlpha:0.3];
    [inboxIcon setAlpha:0.3];
    [settingsIcon setAlpha:0.3];
   
//@"17.42891"
//@"78.429781"
    
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
    
    
    MapAnnotation *annotation = [[MapAnnotation alloc] initWithCoordinate:location];
    
    [mymap addAnnotation:annotation];
    
    [mymap setRegion:region animated:TRUE];
    

    
    
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
    //[self setMapview:nil];

    detailsArray=nil;
    label=nil;
    cell=nil;
    text=nil;
    
      [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
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

- (IBAction)archivebtn:(id)sender {
    archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
    
    [self.navigationController pushViewController:arcscreen animated:NO];
    
}

- (IBAction)settingbtn:(id)sender
{
    
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    
    [self.navigationController pushViewController:setscreen animated:NO];
    
}

- (IBAction)goBack:(id)sender
{
   
    archivedetailview *archiveDetController=[[archivedetailview alloc]initWithNibName:@"archivedetailview" bundle:nil];
    
    [self.navigationController pushViewController:archiveDetController animated:NO];
    
}



-(void)viewDidDisappear:(BOOL)animated
{

    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    mymap=nil;
    archiveimg=nil;
    detailsArray=nil;
    label=nil;
    cell=nil;
    text=nil;
    
}

@end
