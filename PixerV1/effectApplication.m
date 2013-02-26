//
//  effectApplication.m
//  PixerV1
//
//  Created by jitu keshri on 11/18/12.
//
//

#import "effectApplication.h"
#import "UIColor+HexaString.h"
#import "sentcontroller.h"
#import "postCamera.h"
#import <QuartzCore/QuartzCore.h>

@interface effectApplication ()

@end

@implementation effectApplication
@synthesize staticView;
@synthesize subViewImageView;
@synthesize transitSubview;
@synthesize filterName;
@synthesize imageView,pickedImage;
@synthesize camBtnPressed,galleryBtnPressed;


- (void)viewDidLoad
{
    [super viewDidLoad];
      
    dispFilter=[[displayFilter alloc]init];
    
    //[self.view bringSubviewToFront:activitySubView];
    
    //[self performSelector:@selector(loadImage) withObject:nil afterDelay:1];
    
    
    
    rightCount=0;

    leftCount=4;

    [useButton setTitleColor:[UIColor colorWithHexString:@"787878"] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"787878"] forState:UIControlStateNormal];
    [useButton setTitleColor:[UIColor colorWithHexString:@"3c3c3c"] forState:UIControlStateHighlighted];
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"3c3c3c"] forState:UIControlStateHighlighted];
    
   
    
    recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeAction)];
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [imageView addGestureRecognizer:recognizerRight];
    
    recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeAction)];
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [imageView addGestureRecognizer:recognizerLeft];
    
        
}

-(void)loadImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"originalImage.png"];
    
    NSData *jpegData = [NSData dataWithContentsOfFile:filePath];
    
    pickedImage = [UIImage imageWithData:jpegData];
    
   // pickedImage=[self crop:CGRectMake(100,80 ,800, 800)];
    
    NSData *dataFilter1=UIImageJPEGRepresentation([dispFilter filteredImage:1 :pickedImage], 0.1);
    NSData *dataFilter2=UIImageJPEGRepresentation([dispFilter filteredImage:2 :pickedImage], 0.1);
    NSData *dataFilter3=UIImageJPEGRepresentation([dispFilter filteredImage:3 :pickedImage], 0.1);
    
    NSString *filePath1 = [documentsPath stringByAppendingPathComponent:@"filterImage1.png"];
    [dataFilter1 writeToFile:filePath1 atomically:YES];
    
    NSString *filePath2 = [documentsPath stringByAppendingPathComponent:@"filterImage2.png"];
    [dataFilter2 writeToFile:filePath2 atomically:YES];
    
    NSString *filePath3 = [documentsPath stringByAppendingPathComponent:@"filterImage3.png"];
    [dataFilter3 writeToFile:filePath3 atomically:YES];
        
    [filterName setText:@"\"L'original\""];
    [filterName setTextColor:[UIColor   colorWithHexString:@"787878"]];
    
    
    GPUImagePicture *imageToProcess = [[GPUImagePicture alloc] initWithImage:pickedImage];
    
    GPUImageRGBFilter *rgbFilter=[[GPUImageRGBFilter alloc]init];
    
    rgbFilter.blue=2.5;
    
    [imageToProcess addTarget:rgbFilter];
    
    [imageToProcess processImage];
    
    
    UIImage *img=[rgbFilter imageFromCurrentlyProcessedOutput];
    
    GPUImageAlphaBlendFilter *blendFilter = [[GPUImageAlphaBlendFilter alloc] init];
    
    GPUImagePicture *imgGpu=[[GPUImagePicture alloc]initWithImage:img smoothlyScaleOutput:YES];
    
    GPUImagePicture *border = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"vintageBlend"]];
    
    blendFilter.mix = 0.6f;
    
    [imgGpu addTarget:blendFilter];
    
    [border addTarget:blendFilter];
    
    [border processImage];
    
    [imgGpu processImage];
    
    UIImage *bufImg = [self rotateImage:[blendFilter imageFromCurrentlyProcessedOutputWithOrientation:UIImageOrientationRight]];
    
    NSData *dataFilter4=UIImageJPEGRepresentation(bufImg, 0.1);
    
    NSString *filePath4 = [documentsPath stringByAppendingPathComponent:@"filterImage4.png"];
    [dataFilter4 writeToFile:filePath4 atomically:YES];
    
    
    
    bufImg=nil;
    imageToProcess=nil;
    rgbFilter=nil;
    img=nil;
    blendFilter=nil;
    imgGpu=nil;
    border=nil;
    dataFilter4=nil;
    filePath4=nil;
    
    
    imageView.userInteractionEnabled = YES;
    imageView.image=pickedImage;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    documentsPath=nil;
    filePath=nil;
    jpegData=nil;
    paths=nil;
    dataFilter1=nil;
    dataFilter2=nil;
    dataFilter3=nil;
    filePath1=nil;
    filePath2=nil;
    filePath3=nil;
    
    
}

- (UIImage *)crop:(CGRect)rect
{
    
    rect = CGRectMake(rect.origin.x*[[UIScreen mainScreen] scale],
                      rect.origin.y*[[UIScreen mainScreen] scale],
                      rect.size.width*[[UIScreen mainScreen] scale],
                      rect.size.height*[[UIScreen mainScreen] scale]);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(pickedImage.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef
                                          scale:[[UIScreen mainScreen] scale]
                                    orientation:pickedImage.imageOrientation];
    

    CGImageRelease(imageRef);
    return result;
}

-(void)rightSwipeAction
{

    subViewImageView.image=nil;
    
    subViewImageView.image=imageView.image;
    
    imageView.userInteractionEnabled = NO;

    imageView.image=nil;
        
    rightCount++;
    
    if(rightCount>6)
    {
        rightCount=1;
    }
    
    //NSLog(@"right count:%d",rightCount);
    
    leftCount=rightCount;
    
    if (imageView.image==nil)
    {
// [self performSelector:@selector(loadImageWithFilterRightSwipe) withObject:nil afterDelay:1];
        
        
        if (rightCount==1 )
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            imageView.image=[self documentsPathForFileName:@"filterImage1.png"];
            
            filterName.text=[dispFilter filterName:rightCount];
            
        }
        
        
      else  if(rightCount==2)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            imageView.image=[self documentsPathForFileName:@"filterImage2.png"];
            
            filterName.text=[dispFilter filterName:rightCount];
        
        }
    


      else  if(rightCount==3)
        {
            imageView.userInteractionEnabled = YES;
                
            imageView.image=nil;
            
            imageView.image=[self documentsPathForFileName:@"filterImage3.png"];
            
            filterName.text=[dispFilter filterName:rightCount];

        
        }
        
        
        
        
        else if(rightCount==0)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            imageView.image=pickedImage;
            
            filterName.text=@"\"L'original\"";

            //rightCount=0;

        }
        
        
        
        
        else if (rightCount==4)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            imageView.image=[self documentsPathForFileName:@"filterImage4.png"];
            
            filterName.text=@"Vintage";
            
        }
        
    }
    
    subViewImageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:subViewImageView];
    subViewImageView.frame = CGRectMake(0, 46, 322, 320);
    [UIView animateWithDuration:1.0
                     animations:^{
                         subViewImageView.frame = CGRectMake(320, 46, 322, 320);
                     }];
    
}

-(void)leftSwipeAction
{
    subViewImageView.image=imageView.image;
    
    imageView.userInteractionEnabled = NO;

    imageView.image=nil;
        
    leftCount--;

    
    //NSLog(@"left Count:%d",leftCount);

    
    if (imageView.image==nil)
    {
 //[self performSelector:@selector(loadImageWithFilterLeftSwipe) withObject:nil afterDelay:1];
      
        if (leftCount==0)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            imageView.image=pickedImage;
            
            filterName.text=[dispFilter filterName:leftCount];
            
            leftCount=4;
        }

        else if (leftCount==1)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            filterName.text=[dispFilter filterName:leftCount];
            
            imageView.image=[self documentsPathForFileName:@"filterImage1.png"];
            
        }
        
        else if(leftCount==2)
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            filterName.text=[dispFilter filterName:leftCount];
            
            imageView.image=[self documentsPathForFileName:@"filterImage2.png"];
            
        }
        
        else if(leftCount==3 )
        {
            imageView.userInteractionEnabled = YES;
            
            imageView.image=nil;
            
            filterName.text=[dispFilter filterName:leftCount];
            
            imageView.image=[self documentsPathForFileName:@"filterImage3.png"];
                        
        }
    }
    
    
    [self.view addSubview:subViewImageView];
    subViewImageView.contentMode=UIViewContentModeScaleAspectFit;
    subViewImageView.frame = CGRectMake(0, 46, 322, 320);
    [UIView animateWithDuration:1.0
                     animations:^{
                         subViewImageView.frame = CGRectMake(-322, 46, 322, 320);
                     }];
    
    rightCount=leftCount;
    
}

- (UIImage*) rotateImage:(UIImage* )src
{
    
    UIImageOrientation orientation = src.imageOrientation;
    
    UIGraphicsBeginImageContext(src.size);
    
    [src drawAtPoint:CGPointMake(0, 0)];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orientation == UIImageOrientationRight){
        CGContextRotateCTM (context, [self radians:90]);
    }
    else if (orientation == UIImageOrientationLeft) {
        CGContextRotateCTM (context, [self radians:90]);
    }
    else if (orientation == UIImageOrientationDown) {
        // NOTHING
    }
    else if (orientation == UIImageOrientationUp) {
        CGContextRotateCTM (context, [self radians:0]);
    }
    
    return UIGraphicsGetImageFromCurrentImageContext();
}

- (CGFloat) radians:(int)degrees
{
    return (degrees/180)*(22/7);
}

- (void)viewDidUnload
{
    transitSubview=nil;
    pickedImage=nil;
    imageView=nil;
    imageView.image=nil;
    subViewImageView=nil;
    subViewImageView.image=nil;
    recognizerLeft=nil;
    recognizerRight=nil;
    useButton = nil;
    cancelButton = nil;
    dispFilter=nil;
    self.view=nil;
    [self setImageView:nil];
    [self setFilterName:nil];
    [self setSubViewImageView:nil];
    [self setTransitSubview:nil];
    [self setStaticView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)useButton:(id)sender
{
    
//postCamera *postCameraController=[[postCamera alloc]initWithNibName:@"postCamera" bundle:nil];
//    
//    postCameraController.image=imageView.image;
//    
//    [self.navigationController pushViewController:postCameraController animated:NO];
//    
//    postCameraController=nil;
//    
//    imageView.image=nil;
//    
//    sender=nil;
//    
//    imageView=nil;
//    
    
}

- (IBAction)cancelButton:(id)sender
{

    sentcontroller *sentViewCon=[[sentcontroller alloc]initWithNibName:@"sentcontroller" bundle:nil];
    
    [self.navigationController pushViewController:sentViewCon animated:NO];
    
    sentViewCon=nil;
    
    sender=nil;
}

- (UIImage *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSString *filePath=[documentsPath stringByAppendingPathComponent:name];
    
    NSData *imgData=[NSData dataWithContentsOfFile:filePath];
    
    paths=nil;
    documentsPath=nil;
    filePath=nil;
    name=nil;    
    
    return [UIImage imageWithData:imgData];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    imageView.image=nil;
    
    [imageView setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;

    [picker dismissModalViewControllerAnimated:YES];
    
    picker=nil;
    
    info=nil;
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    transitSubview=nil;
    pickedImage=nil;
    subViewImageView=nil;
    subViewImageView.image=nil;
    dispFilter=nil;
    recognizerLeft=nil;
    recognizerRight=nil;
    useButton = nil;
    cancelButton = nil;
    imageView.image=nil;
    imagePicker=nil;
    imageView=nil;
    self.view=nil;
    
    
    
    NSString *extension = @"png";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject]))
    {
        
        if ([[filename pathExtension] isEqualToString:extension])
        {
            
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
    
}

@end
