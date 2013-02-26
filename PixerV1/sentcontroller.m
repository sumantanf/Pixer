//
//  sentcontroller.m
//  pixer
//
//  Created by jitu keshri on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "sentcontroller.h"
#import "archive.h"
#import "ViewController.h"
#import "settingscreen.h"
#import "UIColor+HexaString.h"
#import "applyEffects.h"
#import "effectApplication.h"


@implementation sentcontroller



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [sentButton setHidden:YES];
    
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
    [activityView setBackgroundColor:[UIColor colorWithHexString:@"787878"]];
    [activityView setHidden:YES];
    
    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    

    
    [takpic setTextColor:[UIColor colorWithHexString:@"ffaf32"]];
    
    [chgal setTextColor:[UIColor colorWithHexString:@"ffaf32"]];
    
    [sendpic setBackgroundColor:[UIColor colorWithHexString:@"3a3a3a"]];
    
#pragma Bottombar
    
    [inboxIcon setAlpha:0.3];
    [saveIcon setAlpha:0.3];
    [settingsIcon setAlpha:0.3];
    
}

- (IBAction)inboxbtn:(id)sender{
   
    ViewController *vc=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    [self.view removeFromSuperview];

    [self.navigationController pushViewController:vc animated:NO];
        
    vc=nil;
    sender=nil;

    
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    sendpic.image=nil;
    
    activityBg=nil;
    activityView=nil;


}

- (IBAction)reply:(id)sender{
    
    sentcontroller *sentscr=[[sentcontroller alloc]initWithNibName:@"sentcontroller" bundle:nil];
    
    [self.navigationController pushViewController:sentscr animated:NO];
    
    sentscr=nil;
    sender=nil;
    
    

}

- (IBAction)archivebtn:(id)sender{
    archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
    
    [self.navigationController pushViewController:arcscreen animated:NO];
    
    //[self.navigationController popViewControllerAnimated:NO];
    
    arcscreen=nil;
    sender=nil;

}

- (IBAction)settingbtn:(id)sender {
    
    settingscreen *setscreen=[[settingscreen alloc]initWithNibName:@"settingscreen" bundle:nil];
    
    [self.navigationController pushViewController:setscreen animated:NO];
    
    setscreen=nil;
    
    sender=nil;

    
}

- (IBAction)takepic:(id)sender{
    
    applyEffects *appEff=[[applyEffects alloc]initWithNibName:@"applyEffects" bundle:nil];
    
    appEff.buttonTag=takePic.tag;
    
    [self.navigationController pushViewController:appEff animated:NO];
    
    appEff=nil;
        
}

- (IBAction)gallery:(id)sender{    
    applyEffects *appEff=[[applyEffects alloc]initWithNibName:@"applyEffects" bundle:nil];
    
    appEff.buttonTag=chGal.tag;
    
    [self.navigationController pushViewController:appEff animated:NO];
    
    appEff=nil;
        
}

- (void)viewDidUnload{
    
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    sendpic=nil;
    
    takpic=nil;
    
    chgal=nil;
    
    horizontalBtmBarLbl=nil;
    
    verticalBtmBarLbl1=nil;
    
    verticalBtmBarLbl2=nil;
    
    verticalBtmBarLbl3=nil;
    
    inboxIcon=nil;
    
    replyIcon=nil;
    
    saveIcon=nil;
    
    settingsIcon=nil;
    
    activityView=nil;
    
    activityBg=nil;
    
    sentButton=nil;
    
    [self.view removeFromSuperview];
    
    self.view=nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewDidDisappear:(BOOL)animated{
    inboxIcon.image=nil;
    saveIcon.image=nil;
    settingsIcon.image=nil;
    replyIcon.image=nil;
    
    
    chgal.text=nil;
    
    takpic.text=nil;
    
    takpic=nil;
    
    sendpic=nil;
    
    takpic=nil;
    
    chgal=nil;
    
    horizontalBtmBarLbl=nil;
    
    verticalBtmBarLbl1=nil;
    
    verticalBtmBarLbl2=nil;
    
    verticalBtmBarLbl3=nil;
    
    inboxIcon=nil;
    
    replyIcon=nil;
    
    saveIcon=nil;
    
    settingsIcon=nil;
    
    activityView=nil;
    
    activityBg=nil;
    
    sentButton=nil;
    
    self.view=nil;
    
    [self.view removeFromSuperview];

}

@end
