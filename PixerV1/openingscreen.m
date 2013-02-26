//
//  openingscreen.m
//  PixerV1
//
//  Created by jitu keshri on 9/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "openingscreen.h"
#import "UIColor+HexaString.h"
#import "archivedetailview.h"
#import "ViewController.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "archivemapview.h"
#import "flipSideController.h"

@implementation openingscreen
@synthesize imagesArray,val;



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
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
    
    
    self.navigationController.navigationBarHidden=YES;    
    
        
#pragma Image array
    
    NSMutableArray *imgarr=[[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"old.jpg"],[UIImage imageNamed:@"headwrapped.jpg"],[UIImage imageNamed:@"obama.jpg"],[UIImage imageNamed:@"mug.jpg"],[UIImage imageNamed:@"jone.jpg"],[UIImage imageNamed:@"phillipe.jpg"],[UIImage imageNamed:@"isobel.jpg"],[UIImage imageNamed:@"isobel.jpg"],[UIImage imageNamed:@"lee.jpg"],[UIImage imageNamed:@"lee.jpg"],[UIImage imageNamed:@"many.jpg"],[UIImage imageNamed:@"russian.jpg"],[UIImage imageNamed:@"nastassja.jpg"],[UIImage imageNamed:@"egypt.jpg"],[UIImage imageNamed:@"smile.jpg"],[UIImage imageNamed:@"smile.jpg"],[UIImage imageNamed:@"emma.jpg"],[UIImage imageNamed:@"headwrapped.jpg"],[UIImage imageNamed:@"jone.jpg"],[UIImage imageNamed:@"isobel.jpg"],nil   ];
    
    
    self.imagesArray=imgarr;
    
    [expimage setImage:[imagesArray objectAtIndex:19]];
    
    imgarr=nil;
    
    
}

- (void)viewDidUnload{
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    expimage=nil;
    imagesArray=nil;
    [expimage setImage:nil];
    [self.view removeFromSuperview  ];
    self.view=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

- (IBAction)infobtn:(id)sender {
    
    
    flipSideController *flipController=[[flipSideController alloc]initWithNibName:@"flipSideController" bundle:nil];
    

    [self.navigationController pushViewController:flipController animated:NO ];
    
    flipController=nil;
    sender=nil;
    
}

- (void)viewDidDisappear:(BOOL)animated{
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    expimage=nil;
    imagesArray=nil;
    [expimage setImage:nil];
    self.view=nil;
}

@end
