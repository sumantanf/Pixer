//
//  postCamera.m
//  PixerV1
//
//  Created by jitu keshri on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "postCamera.h"
#import "UIColor+HexaString.h"
#import "ViewController.h"
#import "settingscreen.h"
#import "archive.h"
#import "sentcontroller.h"
#import "notificationController.h"



@implementation postCamera
@synthesize aboutImage;
@synthesize postImageView,postPicture;
@synthesize imageToPost;
@synthesize filterNumber;
@synthesize isImagePosted;

 


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
        
    

    if(filterNumber==-1)
    {
        filterNumber=12;//For left swipe where left count is -1
    }
    
    [self setFilter:filterNumber];

    
    [horizontalBtmBarLbl setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [horizontalBtmBarLbl setAlpha:0.5];
    [verticalBtmBarLbl1 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl1 setAlpha:0.5];
    [verticalBtmBarLbl2 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl2 setAlpha:0.5];
    [verticalBtmBarLbl3 setBackgroundColor:[UIColor colorWithHexString:@"515151"]];
    [verticalBtmBarLbl3 setAlpha:0.5];
    
    
    self.navigationController.navigationBarHidden=YES;
    
    [[NSNotificationCenter defaultCenter]
                        addObserver:self
                        selector:@selector(keyboardWillShow:)
                        name:UIKeyboardWillShowNotification
                        object:nil];
	
	[[NSNotificationCenter defaultCenter]
                         addObserver:self
                         selector:@selector(keyboardWillHide:)
                         name:UIKeyboardWillHideNotification
                         object:nil];
       
    
    //[self performSelector:@selector(prepareImageForUpload) withObject:nil afterDelay:5];
    
}

-(void) setFilter:(int)filterValue
{
    
    switch (filterNumber)
    {
        case 0:
        {
            
            [self removeAllTargets];
            filter = [[GPUImageContrastFilter alloc] init];
            [(GPUImageContrastFilter *) filter setContrast:1.0];
            [self loadImage];
        }break;
            
            
            
        case 1:
        {
            [self removeAllTargets];
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"crossprocess.acv"];
            
            [self loadImage];
        } break;
            
        case 2:
        {
            [self removeAllTargets];
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"02.acv"];
            
            
            
            [self loadImage];
        } break;
            
        case 3: {
            [self removeAllTargets];
            filter = [[GPUImageSepiaFilter alloc] init];
            [self loadImage];
        } break;
            
        case 4: {
            [self removeAllTargets];
            filter = [[GPUImageGrayscaleFilter alloc]init];
            [self loadImage];
        } break;
            
        case 5: {
            [self removeAllTargets];
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"aqua.acv"];
            [self loadImage];
        } break;
            
        case 6: {
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"yellow-red.acv"];
            [self loadImage];
        } break;
            
        case 7: {
            [self removeAllTargets];
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"06.acv"];
            
            [self loadImage];
        } break;
            
            
            
        case 8:{
            
            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"102.acv"];
            [self loadImage];
        }break;
            
            
        case 9:{          
            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"105.acv"];
            [self loadImage];
        }break;
            
            
        case 10:{            
            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"106.acv"];
            [self loadImage];
        }break;
            
            
        case 11:
        {
            [self removeAllTargets];
            filter=[[GPUImagePrewittEdgeDetectionFilter alloc]init];
            
            [self loadImage];
        }break;
            
        case 12:
        {
            
            [self removeAllTargets];
            filter=[[GPUImagePolkaDotFilter  alloc]init];
            [(GPUImagePolkaDotFilter *)filter setFractionalWidthOfAPixel:0.001];
            [self loadImage];
            
        }break;
            
        default:
            filter = [[GPUImageFilter alloc] init];
            break;
    }
}

-(void) loadImage
{
    
    postImageView=[[GPUImageView alloc]initWithFrame:CGRectMake(0,0, 250,250)];
    
    postImageView.backgroundColor=[UIColor clearColor];
    
    [postPicture addTarget:filter];
    
    [filter addTarget:postImageView];
    
    [postPicture processImage];
        
    [imgView addSubview:postImageView];
    
    filter=nil;
      
}

-(void)prepareImageForUpload
{

    UIImageView *sampleView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    
    sampleView.image=[filter imageByFilteringImage:imageToPost];
    
    [self.view addSubview:sampleView];

}

-(void) removeAllTargets
{
    
    [postPicture removeAllTargets];
    [filter removeAllTargets];
    
}

-(void)viewDidUnload
{
    
    
    
    [self removeAllTargets];
    
    aboutImage = nil;
    
    [self setAboutImage:nil];
    
    [self setPostImageView:nil];
    
    imgView = nil;
    
    aboutImage=nil;
    
    postPicture=nil;
    
    imageToPost=nil;
    
    postImageView=nil;
    
    horizontalBtmBarLbl=nil;
    
    verticalBtmBarLbl1=nil;
    
    verticalBtmBarLbl2=nil;
    
    verticalBtmBarLbl3=nil;
    
    
    saySomthingLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) keyboardWillShow: (NSNotification*) aNotification;
{	
	
	[UIView beginAnimations:nil context:NULL];
	
    [UIView setAnimationDuration:0.3];
	
    CGRect rect = [[self view] frame];
	
    rect.origin.y -= 80; 
    
    [[self view] setFrame: rect];
    
	[UIView commitAnimations];
	
    aNotification=nil;
    
}

-(void) keyboardWillHide: (NSNotification*) aNotification;
{
	[UIView beginAnimations:nil context:NULL];
	
    [UIView setAnimationDuration:0.3];
	
    CGRect rect = [[self view] frame];
	
    rect.origin.y += 80; 
    
    [[self view] setFrame: rect];
	
	[UIView commitAnimations];
    
    aNotification=nil;
    
}

-(BOOL)textView:(UITextView *)textView
            shouldChangeTextInRange:(NSRange)range
            replacementText:(NSString *)text
{
    //TO RETURN THE KEYPAD
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        
        if (textView.text.length ==0)
        {
            saySomthingLabel.hidden=NO;
        }

        return NO;
    }
    
       
    
    //TO LIMIT NUMBER OF CHARACTERS TO 60
    if (textView.text.length > 60 && range.length == 0)
    {
        return NO;
    }

    
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{

    saySomthingLabel.hidden=YES;
    return YES;
}



- (IBAction)inboxbtn:(id)sender
{

    
    if (isImagePosted)
    {
        ViewController *vc=[[ViewController alloc]
                            initWithNibName:@"ViewController" bundle:nil];
        
        [self.navigationController pushViewController:vc animated:NO];
        
        vc=nil;
        
        isImagePosted=nil;
        
        sender=nil;
    }
    
    
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Uh-Oh!" message:@"Are you sure to discard the image ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
        
        alert.tag=1;
        
        [alert show];
        
        alert=nil;
    
    }
        
        
}

- (IBAction)reply:(id)sender
{
    
    if (isImagePosted)
    {
        sentcontroller *sentscr=[[sentcontroller alloc]
                                 initWithNibName:@"sentcontroller" bundle:nil];
        
        [self.navigationController pushViewController:sentscr animated:NO];
        
        sentscr=nil;
        
        isImagePosted=nil;
        
        sender=nil;
    }
    
    else
    {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Uh-Oh!" message:@"Are you sure to discard the image ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
        
        alert.tag=2;
        
        [alert show];
        
        alert=nil;
        
    }

    
}

- (IBAction)archivebtn:(id)sender
{

    
    if (isImagePosted)
    {
        archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
        
        [self.navigationController pushViewController:arcscreen animated:NO];
        
        arcscreen=nil;
        
        isImagePosted=nil;
        
        sender=nil;
    }
    
    else
    {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Uh-Oh!" message:@"Are you sure to discard the image ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
        
        alert.tag=3;
        
        [alert show];
        
        alert=nil;
        
    }

}

- (IBAction)settingbtn:(id)sender
{
    
    if (isImagePosted)
    {
        settingscreen *setscreen=[[settingscreen alloc]
                                  initWithNibName:@"settingscreen" bundle:nil];
        
        [self.navigationController pushViewController:setscreen animated:NO];
        
        setscreen=nil;
        
        isImagePosted=nil;

        sender=nil;
    }
    else
    {
    
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Uh-Oh!" message:@"Are you sure to discard the image ?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
        
        alert.tag=4;
        
        [alert show];
        
        alert=nil;
    
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==4) {
        
        if (buttonIndex==1)
        {
            settingscreen *setscreen=[[settingscreen alloc]
                                      initWithNibName:@"settingscreen" bundle:nil];
            
            [self.navigationController pushViewController:setscreen animated:NO];
            
            setscreen=nil;
            
            alertView=nil;
            
        }
        
    }
    
    
    if (alertView.tag==3) {
        
        if (buttonIndex==1)
        {
            archive *arcscreen=[[archive alloc]initWithNibName:@"archive" bundle:nil];
            
            [self.navigationController pushViewController:arcscreen animated:NO];
            
            arcscreen=nil;
            
        }

    }
    
    
    if (alertView.tag==2) {
        
        if (buttonIndex==1)
        {
            sentcontroller *sentscr=[[sentcontroller alloc]
                                     initWithNibName:@"sentcontroller" bundle:nil];
            
            [self.navigationController pushViewController:sentscr animated:NO];
            
            sentscr=nil;
                        
        }
        
    }
    
    
    if (alertView.tag==1) {
        
        if (buttonIndex==1)
        {
            ViewController *vc=[[ViewController alloc]
                                initWithNibName:@"ViewController" bundle:nil];
            
            [self.navigationController pushViewController:vc animated:NO];
            
            vc=nil;
                       
        }
        
    }
    

}

- (IBAction)sendToWorld:(id)sender {
    
        isImagePosted=YES;
        sender=nil;
    
    notificationController *notificationNavController=[[notificationController alloc]initWithNibName:@"notificationController" bundle:nil];
    
    [self.navigationController pushViewController:notificationNavController animated:NO];
    
    notificationNavController=nil;
    
    
}


-(void)viewDidDisappear:(BOOL)animated
{
    
        [self removeAllTargets];
    
        isImagePosted=nil;
        
        imgView=nil;
        
        horizontalBtmBarLbl=nil;
        
        verticalBtmBarLbl1=nil;
        
        verticalBtmBarLbl2=nil;
        
        verticalBtmBarLbl3=nil;
        
        aboutImage=nil;
        
        postPicture=nil;
        
        imageToPost=nil;
        
        postImageView=nil;
    
    saySomthingLabel=nil;
        
        self.view=nil;

 
}

@end
