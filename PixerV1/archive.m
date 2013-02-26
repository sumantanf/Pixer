//
//  archive.m
//  pixer
//
//  Created by jitu keshri on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "archive.h"
#import "UIColor+HexaString.h"
#import "settingscreen.h"
#import "ViewController.h"
#import "archivedetailview.h"
#import "sentcontroller.h"
#import "postCamera.h"


@implementation archive
@synthesize imagesArray,countryarr;

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
    
    
    
    [hd1 setText:@"RECEIVED"];
    
    [hd1 setBackgroundColor:[UIColor colorWithHexString:@"ffaf32"]];
    
    [hd1 setTextAlignment:UITextAlignmentCenter];
    
    [hd2 setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
    [hd2 setText:@"SENT"];
    
    [hd1 setTextColor:[UIColor colorWithHexString:@"333333"]];
    
    [hd2 setTextAlignment:UITextAlignmentCenter];
    
    
    
#pragma Bottombar
        
    [archiveimg setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    [replyIcon setAlpha:0.3];
    [inboxIcon setAlpha:0.3];
    [settingsIcon setAlpha:0.3];


#pragma Image array
    cnames=[[NSMutableArray alloc]initWithObjects:@"Cameroon",@"Thailand",nil];
    
    
    imgarr=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"old.jpg"],[UIImage imageNamed:@"headwrapped.jpg"],nil   ];
    
    
    self.imagesArray=imgarr;
    self.countryarr=cnames;
    
    int x,y;
    x=0;
    y=2;
    for(int j=0;j<[imagesArray count];j++)
    {
        verticalLine=[[UIImageView alloc] initWithFrame:CGRectMake(-1,0,1,960)];
        
        [verticalLine setBackgroundColor:[UIColor colorWithHexString:@"514128"]];
        
        horizontalLine=[[UIImageView alloc] initWithFrame:CGRectMake(-1,-1,320,1)];
        
        [horizontalLine setBackgroundColor:[UIColor colorWithHexString:@"514128"]];
        
        image=[[UIImageView alloc] initWithFrame:CGRectMake(x,y,80,99)];
        
        [image setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
        
        //[image setContentMode:UIViewContentModeScaleAspectFit];
        postImage=[[UIImageView alloc]
                   initWithFrame:CGRectMake(5,5, 69, 70)];//74*74 initial value
        
        [postImage setContentMode:UIViewContentModeScaleToFill];
        
        cfrom=[[UILabel alloc]initWithFrame:CGRectMake(3, 74, 74, 30)];
        
        [cfrom setText:[[countryarr objectAtIndex:j]uppercaseString]];
        
        [cfrom setBackgroundColor:[UIColor clearColor]];
        
        [cfrom setFont:[UIFont fontWithName:@"Futura" size:9]];
        
        [cfrom setTextAlignment:UITextAlignmentCenter];
        
        [cfrom setTextColor:[UIColor colorWithHexString:@"676767"]];
                        
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [button addTarget:self
                   action:@selector(addPopup:)
                    forControlEvents:UIControlEventTouchUpInside];
        
        [button setFrame:CGRectMake(x, y, 77, 74)];
        
        [button setTag:j];
        
        
        if (x>180)
        {
            x=0;
            y=y+100;
        }
        else
        {
            x=x+81;
        }
        if (x==0)
        {
            postImage=[[UIImageView alloc] initWithFrame:CGRectMake(5,5, 67, 70)];
        }
                
        [postImage setImage:[imagesArray objectAtIndex:j]];
        
        [image addSubview:cfrom];
        [image addSubview:postImage];
        [image  addSubview:verticalLine];
        [image addSubview:horizontalLine];
        
        [gridscrollview addSubview:button];
        [gridscrollview addSubview:image];
        
    
    }
        
    [gridscrollview setContentSize:CGSizeMake(320, y+80)];
 
    
    
    imgarr=nil;
    cnames=nil;
    
    }

-(void)addPopup:(id)sender
{
    
    UIButton *b=(UIButton *)sender;
    
    archivedetailview *archdet=[[archivedetailview alloc]initWithNibName:@"archivedetailview" bundle:nil];
    
    archdet.val=b.tag;
    
    [self.navigationController pushViewController:archdet animated:NO];
    
    b=nil;
    sender=nil;
    archdet=nil;
    
    
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
    gridscrollview = nil;
    hd1 = nil;
    hd2 = nil;
    scrbg = nil;
    
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    hd1=nil;
    hd2=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    
    
    image=nil;
    cfrom=nil;
    postImage=nil;
    verticalLine=nil;
    horizontalLine=nil;
    button=nil;
    archiveimg=nil;
    cnames=nil;
    imgarr=nil;
    self.view=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewDidDisappear:(BOOL)animated
{
    gridscrollview = nil;
    hd1 = nil;
    hd2 = nil;
    scrbg = nil;
    
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    hd1=nil;
    hd2=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    
    
    image=nil;
    cfrom=nil;
    postImage=nil;
    verticalLine=nil;
    horizontalLine=nil;
    button=nil;
    archiveimg=nil;
    cnames=nil;
    imgarr=nil;

    self.view=nil;
    
    
    postImage.image=nil;
    postImage=nil;
    image.image=nil;
    verticalLine.image=nil;
    horizontalLine.image=nil;
    
    
    
    inboxIcon.image=nil;
    archiveimg.image=nil;
    settingsIcon.image=nil;
    saveIcon.image=nil;
    replyIcon.image=nil;

    }


@end
