//
//  effectApplication.h
//  PixerV1
//
//  Created by jitu keshri on 11/18/12.
//
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "displayFilter.h"

@interface effectApplication : UIViewController
{



    IBOutlet UIButton *useButton;
    
    IBOutlet UIButton *cancelButton;
    
    UIImagePickerController *imagePicker;
    
    UISwipeGestureRecognizer * recognizerRight;
    
    UISwipeGestureRecognizer * recognizerLeft;
    
    int rightCount;
    
    int leftCount;
    
    GPUImageOutput<GPUImageInput> *sepiaFilter;

    displayFilter *dispFilter;
    
    UIImage *imageToFilter;
    
    UIImage *filterZeroImage;
    
    UIImage *filterOneImage;
    
    UIImage *filterTwoImage;
    
    UIImage *filterThreeImage;
    
    UIImage *filterFourImage;
    
    NSMutableArray *reusableImageArray;
    
    
    BOOL isFilterOne;
    BOOL isFilterTwo;
    BOOL isFilterThree;
    


}

@property  (nonatomic) NSNumber *camBtnPressed;

@property  (nonatomic) NSNumber *galleryBtnPressed;

@property  (strong,nonatomic) IBOutlet UIImageView *subViewImageView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong ,nonatomic) UIImage *pickedImage;

@property (strong, nonatomic) IBOutlet UILabel *filterName;

@property (strong, nonatomic) IBOutlet UIView *transitSubview;


- (UIImage*) rotateImage:(UIImage* )src ;

- (IBAction)useButton:(id)sender;

- (IBAction)cancelButton:(id)sender;



- (UIImage *)documentsPathForFileName:(NSString *)name;


@property (strong, nonatomic) IBOutlet UIView *staticView;

- (UIImage *)crop:(CGRect)rect;

-(void)loadImage;







@end
