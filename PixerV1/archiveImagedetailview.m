//
//  archiveImagedetailview.m
//  PixerV1
//
//  Created by pravasis on 12/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "archiveImagedetailview.h"
#import "archivemapview.h"
#import "MapAnnotation.h"
#import "UIColor+HexaString.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "ViewController.h"





@interface archiveImagedetailview ()

@end

@implementation archiveImagedetailview
@synthesize detailimageview,imagesArray,val;

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
   
    
#pragma BottomBar
    [archiveimg setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    [replyIcon setAlpha:0.3];
    [inboxIcon setAlpha:0.3];
    [settingsIcon setAlpha:0.3];
    

    // Do any additional setup after loading the view from its nib.
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    
    
    NSMutableArray *imgarr=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"old.jpg"],[UIImage imageNamed:@"headwrapped.jpg"],[UIImage imageNamed:@"obama.jpg"],[UIImage imageNamed:@"mug.jpg"],[UIImage imageNamed:@"jone.jpg"],[UIImage imageNamed:@"phillipe.jpg"],[UIImage imageNamed:@"isobel.jpg"],[UIImage imageNamed:@"isobel.jpg"],[UIImage imageNamed:@"lee.jpg"],[UIImage imageNamed:@"lee.jpg"],[UIImage imageNamed:@"many.jpg"],[UIImage imageNamed:@"russian.jpg"],[UIImage imageNamed:@"nastassja.jpg"],[UIImage imageNamed:@"egypt.jpg"],[UIImage imageNamed:@"smile.jpg"],[UIImage imageNamed:@"smile.jpg"],[UIImage imageNamed:@"emma.jpg"],[UIImage imageNamed:@"headwrapped.jpg"],[UIImage imageNamed:@"jone.jpg"],[UIImage imageNamed:@"isobel.jpg"],[UIImage imageNamed:@"landscape.png"],[UIImage imageNamed:@"porto.jpeg"],[UIImage imageNamed:@"Monalisa.jpeg"],nil   ];
    
    
    self.imagesArray=imgarr;
    
    
    [detailimageview setImage:[imagesArray objectAtIndex:val]];
    
    [detailimageview setContentMode:UIViewContentModeScaleAspectFit];
    
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

- (IBAction)settingbtn:(id)sender {
    
    
    
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    
    [self.navigationController pushViewController:setscreen animated:NO];
    
    
    
    
}


- (void)viewDidUnload
{
    [self setDetailimageview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    detailimageview=nil;
    archiveimg=nil;
}

@end
