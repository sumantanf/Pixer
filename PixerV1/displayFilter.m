//
//  displayFilter.m
//  PixerV1
//
//  Created by jitu keshri on 11/24/12.
//
//

#import "displayFilter.h"



@implementation displayFilter





-(UIImage *)filteredImage:(int)filterNumber:(UIImage *)sourceImage
{

    switch (filterNumber)
    {
        case 0:
            
            return sourceImage;
            
            break;
            
        case 1:
            
            imageSoftEleganceFilter=[[GPUImageSoftEleganceFilter alloc] init];
            
            sourceImage=[imageSoftEleganceFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
            break;
            
        case 2:
            
            missetikateFilter=[[GPUImageMissEtikateFilter alloc]init];
            
            sourceImage=[missetikateFilter imageByFilteringImage:sourceImage];
        
            return sourceImage;
            
            break;
            
            
         case 3:
            
            amatorkaFilter=[[GPUImageAmatorkaFilter  alloc]init];
            
            sourceImage=[amatorkaFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
            
          case 4:
        
            grayScaleFilter =[[GPUImageGrayscaleFilter alloc]init];
            
            sourceImage =[grayScaleFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            

          case 5:
            
            opacityFilter=[[GPUImageOpacityFilter alloc]init];
            
            opacityFilter.opacity=0.3;
            
            sourceImage=[opacityFilter imageByFilteringImage:sourceImage];

            return sourceImage;

          case 6:
            
            lumThresholdFilter=[[GPUImageLuminanceThresholdFilter alloc]init];
            
            lumThresholdFilter.threshold=0.3;
            
            sourceImage =[lumThresholdFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
          case 7:

            openingFilter=[[GPUImageOpeningFilter alloc]init];
            
            sourceImage=[openingFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
          case 8:
            
            erosionFilter=[[GPUImageErosionFilter   alloc]init];
            
            sourceImage=[erosionFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
            
          case 9:
            
            dilationFilter=[[GPUImageDilationFilter alloc]init];
            
            sourceImage =[dilationFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
            
          case 10:
            
            closingFilter=[[GPUImageClosingFilter alloc]init];
            
            sourceImage =[closingFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            


          case 11:
            
            embossFilter=[[GPUImageEmbossFilter alloc]init];
            
            embossFilter.intensity=2.0;
            
            sourceImage =[embossFilter imageByFilteringImage:sourceImage];
            
            return sourceImage;
            
            

            
            
        default:
            return sourceImage;
            break;
    }

}



-(NSString *)filterName:(int)filterNumber
{

    switch (filterNumber)
    {
        case 0:
                        
            stringName=@"\"L'original\"";
            return   stringName;
            break;
            
        case 1:
            stringName=@"Filter1";
            return stringName;
            break;
                    
        case 2:
            
            stringName=@"Filter2";
            return stringName;
            break;
            
        case 3:
            stringName=@"Filter3";
            return stringName;
            break;
            
        case 4:
            stringName=@"Grayscale";
            return stringName;
            break;
            
        case 5:
            stringName=@"Opacity";
            return stringName;
            break;
            
        case 6:
            stringName=@"Luminance Threshold";
            return stringName;
            break;
            
        case 7:
            stringName=@"Opening";
            return stringName;
            break;
            
        case 8:
            stringName=@"Erosion";
            return stringName;
            break;
            
        case 9:
            stringName=@"Dilation";
            return stringName;
            
        case 10:
            stringName=@"Closing";
            return stringName;
            

            
        case 11:
            stringName=@"Emboss";
            return stringName;
            
            
        default:
            
            stringName =@"\"L'original\"";
            return   stringName;
            break;
    }
    
    
}


@end
