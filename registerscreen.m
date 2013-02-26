//
//  registerscreen.m
//  PixerV1
//
//  Created by jitu keshri on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "registerscreen.h"
#import "UIColor+HexaString.h"
#import "settingscreen.h"
#import "ViewController.h"
#import "archive.h"
#import "sentcontroller.h"

@implementation registerscreen
@synthesize emailtxt;
@synthesize usernametxt;
@synthesize passwordtxt;
@synthesize confirmpasstxt;
@synthesize countrytxt;
@synthesize agetxt;

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
    
    [bbbarbg setBackgroundColor:[UIColor colorWithHexString:@"585858"]];
    
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
    //[orlbl setFont:[UIFont fontWithName:@"Freebooter Script" size:14 ]];
    
    
#pragma Bottombar
    
    
    [inbox setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
    [sendpic setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
    [archivebtn setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    
    [login setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    
    [replyIcon setAlpha:0.3];
    [inboxIcon setAlpha:0.3];
    [saveIcon setAlpha:0.3];
    
#pragma UILabel
    

    
    [reglbl setTextColor:[UIColor colorWithHexString:@"ffaf32"]];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.emailtxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];    
    
    [self.usernametxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.passwordtxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
   [self.confirmpasstxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.countrytxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.agetxt addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

- (void) keyboardWillShow: (NSNotification*) aNotification{	
	
	[UIView beginAnimations:nil context:NULL];
	
    [UIView setAnimationDuration:0.3];
	
    CGRect rect = [[self view] frame];
	
    rect.origin.y -= 60; 
    
    [[self view] setFrame: rect];
    
	[UIView commitAnimations];
	
}

- (void) keyboardWillHide: (NSNotification*) aNotification{
	[UIView beginAnimations:nil context:NULL];
	
    [UIView setAnimationDuration:0.3];
	
    CGRect rect = [[self view] frame];
	
    rect.origin.y += 60; 
    
    [[self view] setFrame: rect];
	
	[UIView commitAnimations];
}
                    
- (void)viewDidUnload{
    [self setEmailtxt:nil];
    [self setUsernametxt:nil];
    [self setPasswordtxt:nil];
    [self setConfirmpasstxt:nil];
    [self setCountrytxt:nil];
    [self setAgetxt:nil];
    emaillbl = nil;
    unamelbl = nil;
    passlbl = nil;
    cpasslbl = nil;
    countrylbl = nil;
    genderlbl = nil;
    reglbl = nil;
    disclaimerlbl = nil;
    discstar = nil;
    txtscrollview = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewDidDisappear:(BOOL)animated{
    horizontalBtmBarLbl=nil;
    verticalBtmBarLbl1=nil;
    verticalBtmBarLbl2=nil;
    verticalBtmBarLbl3=nil;
    inboxIcon=nil;
    saveIcon=nil;
    settingsIcon=nil;
    replyIcon=nil;
    
    
    emailtxt=nil;
    usernametxt=nil;
    passwordtxt=nil;
    confirmpasstxt=nil;
    countrytxt=nil;
    agetxt=nil;
    emaillbl=nil;
    unamelbl=nil;
    passlbl=nil;
    cpasslbl=nil;
    countrylbl=nil;
    genderlbl=nil;
    reglbl=nil;
    disclaimerlbl=nil;
    discstar=nil;
    txtscrollview=nil;
    login=nil;
    
    
}

@end
