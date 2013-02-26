//
//  applyEffects.h
//  PixerV1
//
//  Created by jitu keshri on 12/6/12.
//
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
@interface applyEffects : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    GPUImageOutput<GPUImageInput> *filter;
    GPUImagePicture *staticPicture;
    GPUImageView *imageView;
    GPUImageView *subImageView;

    
    UISwipeGestureRecognizer * recognizerRight;
    UISwipeGestureRecognizer * recognizerLeft;
    
    int rightCount;
    int leftCount;
    
    
    IBOutlet UIButton *useButton;
    IBOutlet UIButton *cancelButton;

    
    UIImagePickerController *picker;
    UIImageView *imgView;

    IBOutlet UILabel *filterName;
    
    UIImage *bufferImage;
    
}
 

@property (strong, nonatomic) IBOutlet GPUImageView *mainImage;

@property (nonatomic) int buttonTag;

- (IBAction)useButton:(id)sender;

- (IBAction)cancelButton:(id)sender;


@end
