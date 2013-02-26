//
//  settingscreen.m
//  pixer
//
//  Created by jitu keshri on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "settingscreen.h"
#import "UIColor+HexaString.h"
#import "ViewController.h"
#import "archive.h"
#import "sentcontroller.h"
#import "loginscreen.h"
#import "registerscreen.h"



@implementation settingscreen

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
    
    
    self.navigationController.navigationBarHidden=YES;
    

    
        
#pragma Bottombar
    

    
    [login setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    [replyIcon setAlpha:0.3];
    [inboxIcon setAlpha:0.3];
    [saveIcon setAlpha:0.3];
    

}

- (void)viewDidUnload
{

    loginbtn = nil;
    registerbtn = nil;
    
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    login=nil;
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


- (IBAction)registerbtn:(id)sender 

{
    registerscreen *regscreen=[[registerscreen alloc]initWithNibName:@"registerscreen" bundle:nil];
    
    [self.navigationController pushViewController:regscreen animated:NO];
    
    
    
}

- (IBAction)loginbtn:(id)sender 

{
    
    loginscreen *logscr=[[loginscreen alloc]initWithNibName:@"loginscreen" bundle:nil];
    
    
    [self.navigationController pushViewController:logscr animated:NO   ];
    
    
    
}

- (void)dealloc
{
    
    loginbtn = nil;
    registerbtn = nil;
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    login=nil;
}


-(void)viewDidDisappear:(BOOL)animated
{
    loginbtn = nil;
    registerbtn = nil;
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    login=nil;
    self.view=nil;
    
}


@end
