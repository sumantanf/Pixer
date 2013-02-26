//
//  ViewController.m
//  pixer
//
//  Created by jitu keshri on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "archive.h"
#import "ViewController.h"
#import "UIColor+HexaString.h"
#import "settingscreen.h"
#import "sentcontroller.h"
#import "openingscreen.h"
#import "splashController.h"
#import "envelopeController.h"



@implementation ViewController
@synthesize tabledata,flagarray,locarray;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [inboxButton setHidden:YES];

    

    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
        
    self.navigationController.navigationBarHidden=YES;
    
        
    NSMutableArray *arr=[[NSMutableArray alloc]initWithObjects:@"Denmark",@"B",@"C",@"D", nil];
    self.tabledata =arr ;
    
    
    NSMutableArray *arrf=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"danish flag.png"],[UIImage imageNamed:@"japanese flag.png"],[UIImage imageNamed:@"danish flag.png"],[UIImage imageNamed:@"japanese flag.png"], nil];
    
    
    NSMutableArray *arrloctxt=[[NSMutableArray alloc]initWithObjects:@"Copenhagen, Denmark",@"Osaka, Japan",@"Copenhagen, Denmark",@"Osaka, Japan" ,nil];
    
    self.flagarray=arrf;
    self.locarray=arrloctxt;
    
#pragma Bottombar
    
    
    [inbox setFrame:CGRectMake(0, 410, 80, 50)];
    [inbox setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    [replyIcon setAlpha:0.3];
    [saveIcon setAlpha:0.3];
    [settingsIcon setAlpha:0.3];
    
    arrf=nil;
    arr=nil;
    arrloctxt=nil;
    
}
#pragma UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{

    return tabledata.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{

    NSString *str=@"simpleIdentifier";
    
    cell=[tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell==nil) 
    {
        cell=[[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
       imageView = [[UIImageView alloc] initWithFrame:CGRectMake(19,20,284, 92)];
        [imageView setTag:1];
        [cell addSubview:imageView];
        
        headerlbl=[[UILabel alloc]initWithFrame:CGRectMake(50, 28, 250, 30 )];
        [headerlbl setTag:2];
        [cell addSubview:headerlbl];
        
        
        horizontalline=[[UILabel alloc]initWithFrame:CGRectMake(31, 53, 260, 1)];
        [horizontalline setTag:3];
        [cell addSubview:horizontalline];
        
        
        verticalline=[[UILabel alloc]initWithFrame:CGRectMake(107,57,1,44)];
        [verticalline setTag:4];
        [cell addSubview:verticalline];
        
        flagiv=[[UIImageView alloc]initWithFrame:CGRectMake(54,68, 28, 17)];
        [flagiv setTag:5];
        [cell addSubview:flagiv];
        
        locationtxt=[[UILabel alloc]initWithFrame:CGRectMake(104, 58, 193, 40)];
        [locationtxt  setTag:6  ];
        [cell addSubview:locationtxt];
    }
    
    imgView = (UIImageView*)[cell viewWithTag:1];
    [imgView setImage:[UIImage imageNamed:@"inbox border.png"]];
    
    headlbl=(UILabel *)[cell viewWithTag:2];
    [headlbl setText:[NSString stringWithFormat:@"You've received a new picture postcard from:"]];
    [headlbl setTextColor:[UIColor colorWithHexString:@"787878"]];
    [headlbl setFont:[UIFont fontWithName:@"Futura" size:11]];
    [headlbl setBackgroundColor:[UIColor clearColor]];
    
    
    horlbl=(UILabel *)[cell viewWithTag:3];
    [horlbl setBackgroundColor:[UIColor colorWithHexString:@"676767"]];
    
    verlbl=(UILabel *)[cell viewWithTag:4];
    [verlbl setBackgroundColor:[UIColor colorWithHexString:@"676767"]];
    
    
    
    fview=(UIImageView *)[cell viewWithTag:5];
    [fview setImage:[flagarray objectAtIndex:[indexPath row]]];
    
    
    lotxt=(UILabel *)[cell viewWithTag:6];
    [lotxt setText:[locarray objectAtIndex:[indexPath row]]];
    [lotxt setFont:[UIFont fontWithName:@"Futura" size:12]];
    [lotxt setBackgroundColor:[UIColor clearColor]];
    [lotxt setTextAlignment:UITextAlignmentCenter];
    [lotxt setTextColor:[UIColor colorWithHexString:@"787878"]];
    
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    tableView=nil;
    indexPath=nil;
    str=nil;
    
    return cell;
    
    
    

    
    
}

#pragma UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{

    envelopController *envelopeController=[[envelopController  alloc]initWithNibName:@"envelopeController" bundle:nil];
    
    [self.navigationController pushViewController:envelopeController animated:NO];
    
    envelopeController=nil;    
    tableView=nil;
    indexPath=nil;
}



- (void)viewDidUnload
{
       
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    
    
    inbox.image=nil;
    flagiv.image=nil;
    fview.image=nil;
    imgView.image=nil;
    imageView.image=nil;
    
    
    tblinbox= nil;
    
    inbox= nil;
    
    horizontalBtmBarLbl= nil;
    
    verticalBtmBarLbl1= nil;
    
    verticalBtmBarLbl2= nil;
    
    verticalBtmBarLbl3= nil;
    
    inboxIcon= nil;
    
    replyIcon= nil;
    
    saveIcon= nil;
    
    settingsIcon= nil;
    
    cell= nil;
    
    
    
    imageView= nil;
    headerlbl= nil;
    horizontalline= nil;
    verticalline= nil;
    flagiv= nil;
    locationtxt= nil;
    
    
    
    inboxButton= nil;
    
    
    imgView= nil;
    headlbl= nil;
    horlbl= nil;
    verlbl= nil;
    fview= nil;
    lotxt= nil;
    
    
    
    tabledata=nil;
    flagarray=nil;
    locarray=nil;
    
    

    
    
    [self.view removeFromSuperview];
    self.view=nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)viewDidDisappear:(BOOL)animated
{
    headerlbl.text=nil;
    locationtxt.text=nil;
    lotxt.text=nil;
    headlbl.text=nil;
    
    
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    
    
    inbox.image=nil;
    flagiv.image=nil;
    fview.image=nil;
    imgView.image=nil;
    imageView.image=nil;
    
    tblinbox= nil;
    
    inbox= nil;
    
    horizontalBtmBarLbl= nil;
    
    verticalBtmBarLbl1= nil;
    
    verticalBtmBarLbl2= nil;
    
    verticalBtmBarLbl3= nil;
    
    inboxIcon= nil;
    
    replyIcon= nil;
    
    saveIcon= nil;
    
    settingsIcon= nil;
    
    cell= nil;
    
    
    
    imageView= nil;
    headerlbl= nil;
    horizontalline= nil;
    verticalline= nil;
    flagiv= nil;
    locationtxt= nil;
    
    
    
    inboxButton= nil;
    
    
    imgView= nil;
    headlbl= nil;
    horlbl= nil;
    verlbl= nil;
    fview= nil;
    lotxt= nil;
    
    
    
    tabledata=nil;
    flagarray=nil;
    locarray=nil;
    
    
    [self.view removeFromSuperview];
    self.view=nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{

}

- (IBAction)inboxbtn:(id)sender
{
    
    
    ViewController *vc=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    [self.navigationController pushViewController:vc animated:NO];
    
    vc=nil;
    
    sender=nil;
    
 
}

- (IBAction)reply:(id)sender
{
    
    sentcontroller *sentscr=[[sentcontroller alloc]initWithNibName:@"sentcontroller" bundle:nil];
    [self.view removeFromSuperview];
    [self.navigationController pushViewController:sentscr animated:NO];
    
    //[self presentModalViewController:sentscr animated:NO];
    
    sentscr=nil;
    sender=nil;
    
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    
    
    inbox.image=nil;
    flagiv.image=nil;
    fview.image=nil;
    imgView.image=nil;
    imageView.image=nil;
}

- (IBAction)archivebtn:(id)sender 
{
    archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];

    [self.navigationController pushViewController:arcscreen animated:NO];
    
    arcscreen=nil;
    sender=nil;
}

- (IBAction)settingbtn:(id)sender 
{
        
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    [self.navigationController pushViewController:setscreen animated:NO];
    
    setscreen=nil;
    sender=nil;
}


@end
