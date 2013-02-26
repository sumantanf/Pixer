//
//  displayFilter.h
//  PixerV1
//
//  Created by jitu keshri on 11/24/12.
//
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"


@interface displayFilter : UIImageView

{
    NSString *stringName;
    GPUImageToneCurveFilter *filter;

    GPUImageOutput<GPUImageInput> *sepiaFilter;
    GPUImageBrightnessFilter *brightnessFilter;
    GPUImageColorInvertFilter *invertFilter;
    GPUImageGrayscaleFilter *grayScaleFilter;
    GPUImageOpacityFilter *opacityFilter;
    GPUImageLuminanceThresholdFilter *lumThresholdFilter;
    GPUImageOpeningFilter *openingFilter;
    GPUImageErosionFilter *erosionFilter;
    GPUImageDilationFilter *dilationFilter;
    GPUImageClosingFilter  *closingFilter;
    GPUImageEmbossFilter *embossFilter;
    GPUImagePosterizeFilter *posterizeFilter;
    GPUImageAmatorkaFilter *amatorkaFilter;
    GPUImageMissEtikateFilter *missetikateFilter;
    GPUImageSoftEleganceFilter *imageSoftEleganceFilter;
    GPUImageDissolveBlendFilter *dissolveBlendFilter;

}



-(UIImage *)filteredImage:(int)filterNumber:(UIImage *)sourceImage;
-(NSString *)filterName:(int)filterNumber;







@end
