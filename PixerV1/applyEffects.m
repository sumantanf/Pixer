//
//  applyEffects.m
//  PixerV1
//
//  Created by jitu keshri on 12/6/12.
//
//

#import "applyEffects.h"
#import "UIColor+HexaString.h"
#import "postCamera.h"
#import "sentcontroller.h"

@interface applyEffects ()

@end

@implementation applyEffects
@synthesize buttonTag;

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
    // Do any additional setup after loading the view from its nib.
    
    rightCount=0;

    [useButton setTitleColor:[UIColor colorWithHexString:@"787878"]
                    forState:UIControlStateNormal];
    
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"787878"]
                       forState:UIControlStateNormal];
    
    [useButton setTitleColor:[UIColor colorWithHexString:@"3c3c3c"]
                    forState:UIControlStateHighlighted];
    
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"3c3c3c"]
                       forState:UIControlStateHighlighted];
    
    [filterName setTextColor:[UIColor colorWithHexString:@"787878"]];
    
    if (buttonTag==1) {
        
            picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            picker.allowsEditing=YES;
            [self presentModalViewController:picker animated:NO];
        
            
             picker=nil;
            [picker setDelegate:nil];
    }
    
    
    else if (buttonTag==2){
    
            picker=[[UIImagePickerController alloc] init];
            picker.allowsEditing=YES;
            [picker setDelegate:self];
            [picker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            [self presentViewController:picker animated:YES completion:NULL];
        
             picker=nil;
            [picker setDelegate:nil];
    
    }
    
    
   
    
}

- (void)imagePickerController:(UIImagePickerController *)picker1 didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    bufferImage=[info objectForKey:UIImagePickerControllerEditedImage];
    
    imageView=[[GPUImageView alloc]initWithFrame:CGRectMake(0, 44, 320,322)];
    
    [imageView setUserInteractionEnabled:YES];
        
    staticPicture = [[GPUImagePicture alloc]
                     initWithImage:[info  objectForKey:UIImagePickerControllerEditedImage]
                     smoothlyScaleOutput:YES];
    
    filterName.text=@"\"L'original\"";//Default Case Whenever The View Is Loaded
    
    [staticPicture addTarget:imageView];
    
    [staticPicture processImage];
       
    recognizerRight = [[UISwipeGestureRecognizer alloc]
                       initWithTarget:self
                       action:@selector(rightSwipeAction)];
    
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [imageView addGestureRecognizer:recognizerRight];
    
    recognizerLeft = [[UISwipeGestureRecognizer alloc]
                      initWithTarget:self
                      action:@selector(leftSwipeAction)];
    
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [imageView addGestureRecognizer:recognizerLeft];
    
    [self.view addSubview:imageView];
   
    [picker1 dismissModalViewControllerAnimated:NO];
    
    

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker1
{
    [picker setDelegate:nil];
    
    sentcontroller *sentViewCon=[[sentcontroller alloc]
                                 initWithNibName:@"sentcontroller" bundle:nil];
    
    [self.navigationController pushViewController:sentViewCon animated:NO];
    
    sentViewCon=nil;
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)rightSwipeAction
{
    
    [self removeAllTargets];
    
    rightCount++;
    
    leftCount=rightCount;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         imageView.frame = CGRectMake(322,44, 320, 322);}];

    [self performSelector:@selector(setFilterRightCount) withObject:nil afterDelay:0.5];
    
    imageView=nil;
    
}

-(void)leftSwipeAction
{
    
    [self removeAllTargets];

    leftCount--;
    
    rightCount=leftCount;
    
    if (leftCount==-1)
    {
        leftCount=12;
    }
        
    [UIView animateWithDuration:0.5
                     animations:^{
                         imageView.frame = CGRectMake(-322, 44, 320, 322);
                     }];
    
    [self performSelector:@selector(setFilterLeftCount) withObject:nil afterDelay:0.5];
    
    imageView=nil;
    
}

-(void) setFilterRightCount
{
    
    switch (rightCount)
    {
            case 0:
        {
        
            [self removeAllTargets];
            filterName.text=@"\"L'original\"";
            filter = [[GPUImageContrastFilter alloc] init];
            [(GPUImageContrastFilter *) filter setContrast:1.0];
            
            leftCount=13;
            rightCount=0;
            [self loadImage];
        }break;
            

            
        case 1:
        {
            [self removeAllTargets];
            filterName.text=@"\"Punch It\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"crossprocess.acv"];
                    
            [self loadImage];
        } break;
            
        case 2:
        {
            [self removeAllTargets];
            filterName.text=@"\"Whatta Washout\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"02.acv"];
            

            
            [self loadImage];
        } break;
            
        case 3: {
            [self removeAllTargets];
            filterName.text=@"\"Cliché Sepia\"";
            filter = [[GPUImageSepiaFilter alloc] init];
            [self loadImage];     
        } break;
            
        case 4: {
            [self removeAllTargets];
            filterName.text=@"\"Life in Grey\"";
            filter = [[GPUImageGrayscaleFilter alloc]init];
            [self loadImage];
        } break;
            
        case 5: {
            [self removeAllTargets];
            filterName.text=@"\"Got the Blues\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"aqua.acv"];
            [self loadImage];
        } break;
            
        case 6: {
            filterName.text=@"\"Emerald Pitch\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"yellow-red.acv"];
            [self loadImage];
        } break;
            
        case 7: {
            [self removeAllTargets];
            filterName.text=@"\"Faded Memories\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"06.acv"];

            [self loadImage];
        } break;
            

            
        case 8:{
            filterName.text=@"\"Another Day\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"102.acv"];
            [self loadImage];
        }break;

                    
        case 9:{
            filterName.text=@"\"Hi-C Lo-B\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"105.acv"];
            [self loadImage];
        }break;

            
        case 10:{
            filterName.text=@"\"Negation Theorem\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"106.acv"];
            [self loadImage];
        }break;


        case 11:
        {
            filterName.text=@"\"The Edge\"";
            [self removeAllTargets];
            //rightCount=-1;
            filter=[[GPUImagePrewittEdgeDetectionFilter alloc]init];

            [self loadImage];
        }break;
            
        case 12:
        {
            filterName.text=@"\"Mesh\"";
                        
            [self removeAllTargets];
            rightCount=-1;
            filter=[[GPUImagePolkaDotFilter  alloc]init];
            [(GPUImagePolkaDotFilter *)filter setFractionalWidthOfAPixel:0.001];
            [self loadImage];
            
        }break;
            
        default:
            filter = [[GPUImageFilter alloc] init];
            break;
    }

}

-(void) setFilterLeftCount
{    
[self removeAllTargets];
    

    switch (leftCount)
    {

        case 0:{
            [self removeAllTargets];
            filterName.text=@"\"L'original\"";
            filter = [[GPUImageContrastFilter alloc] init];
            [(GPUImageContrastFilter *) filter setContrast:1.0];

            leftCount=13;
            rightCount=0;
            [self loadImage];
            
        }break;
            

            
        case 1: {
            [self removeAllTargets];
            filterName.text=@"\"Punch It\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"crossprocess.acv"];
            [self loadImage];
        } break;
            
        case 2: {
            [self removeAllTargets];
            filterName.text=@"\"Whatta Washout\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"02.acv"];
            [self loadImage];
        } break;
            
        case 3: {
            [self removeAllTargets];
            filterName.text=@"\"Cliché Sepia\"";
            filter = [[GPUImageSepiaFilter alloc] init];
            [self loadImage];
        } break;
            
        case 4: {
            [self removeAllTargets];
            filterName.text=@"\"Life in Grey\"";
            filter = [[GPUImageGrayscaleFilter alloc]init];
            [self loadImage];
        } break;
            
        case 5: {
            [self removeAllTargets];
            filterName.text=@"\"Got the Blues\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"aqua.acv"];
            [self loadImage];
            
        } break;
            
        case 6: {
            [self removeAllTargets];
            filterName.text=@"\"Emerald Pitch\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"yellow-red.acv"];
            [self loadImage];
        } break;
            
        case 7: {
            [self removeAllTargets];
            filterName.text=@"\"Faded Memories\"";
            filter = [[GPUImageToneCurveFilter alloc] initWithACV:@"06.acv"];
            [self loadImage];
        } break;
            

            
            
        case 8:{
            filterName.text=@"\"Another Day\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"102.acv"];
            [self loadImage];
        }break;            
            
            
            
        case 9:{
            filterName.text=@"\"Hi-C Lo-B\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"105.acv"];
            [self loadImage];
        }break;

            
        case 10:{
            filterName.text=@"\"Negation Theorem\"";

            [self removeAllTargets];
            filter=[[GPUImageToneCurveFilter alloc]initWithACV:@"106.acv"];
            [self loadImage];
        }break;

        
        case 11:
        {
            filterName.text=@"\"The Edge\"";
            [self removeAllTargets];
            //rightCount=-1;
            filter=[[GPUImagePrewittEdgeDetectionFilter alloc]init];
            
            [self loadImage];
        }break;
        
        case 12:
        {
            filterName.text=@"\"Mesh\"";
            [self removeAllTargets];
            rightCount=-1;
            filter=[[GPUImagePolkaDotFilter alloc]init];
            [(GPUImagePolkaDotFilter *)filter setFractionalWidthOfAPixel:0.001];
            
            
            [self loadImage];
        }break;
            
        default:
            filter = [[GPUImageFilter alloc] init];
            break;
    }
    
}

-(void) removeAllTargets
{

    [staticPicture removeAllTargets];
    [filter removeAllTargets];
    
}

-(void) loadImage
{
    [self removeAllTargets];
    
    imageView=[[GPUImageView alloc]initWithFrame:CGRectMake(0,44, 320,322)];
    [imageView setUserInteractionEnabled:YES];
        
    //GPUImagePosterizeFilter *f1=[[GPUImagePosterizeFilter alloc]init];
    
    [staticPicture addTarget:filter];
    
    
    [filter addTarget:imageView];
    [staticPicture processImage];
    
    recognizerRight = [[UISwipeGestureRecognizer alloc]
                       initWithTarget:self action:@selector(rightSwipeAction)];
    
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [imageView addGestureRecognizer:recognizerRight];
    
    recognizerLeft = [[UISwipeGestureRecognizer alloc]
                      initWithTarget:self action:@selector(leftSwipeAction)];
    
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [imageView addGestureRecognizer:recognizerLeft];

    [self.view addSubview:imageView];
    
    
    recognizerLeft=nil;
    recognizerRight=nil;
    filter=nil;

}

- (IBAction)useButton:(id)sender
{
    
    postCamera *postCameraController=[[postCamera alloc]
                                      initWithNibName:@"postCamera" bundle:nil];
    
    postCameraController.postPicture=staticPicture;
    
    postCameraController.filterNumber=rightCount;
    
    postCameraController.imageToPost=bufferImage;
    
    [self.navigationController pushViewController:postCameraController animated:NO];
    
    postCameraController=nil;
       
    sender=nil;
    
    imageView=nil;
    
    staticPicture=nil;
    
    bufferImage=nil;
    
    
}

- (IBAction)cancelButton:(id)sender
{
    
    sentcontroller *sentViewCon=[[sentcontroller alloc]
                                 initWithNibName:@"sentcontroller" bundle:nil];
    
    [self.navigationController pushViewController:sentViewCon animated:NO];
    
    sentViewCon=nil;
    
    sender=nil;
}

- (void)viewDidUnload
{
    filterName = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    filter=nil;
    staticPicture=nil;
    imageView=nil;
    subImageView=nil;
    
    
    recognizerRight=nil;
    recognizerLeft=nil;
    
    
    useButton=nil;
    cancelButton=nil;
    picker=nil;
    imgView=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewDidDisappear:(BOOL)animated
{
    filter=nil;
    staticPicture=nil;
    imageView=nil;
    subImageView=nil;
    recognizerRight=nil;
    recognizerLeft=nil;
    useButton=nil;
    cancelButton=nil;
    picker=nil;
    imgView=nil;
}



@end
