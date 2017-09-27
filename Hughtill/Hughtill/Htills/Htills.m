//
//  Htills.m
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "Htills.h"

@implementation Htills

//clone create
+ (id) copy:(id)object
{
    id copyOfView = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:object]];
    return copyOfView;
}

/*
+ (UIImage*) imageSizeToDevice:(UIImage*)image
{
    float imageWidth    = image.size.width;
    float imageHeight   = image.size.height;
    
    float deviceWidth   = [[UIScreen mainScreen] bounds].size.width;
    float deviceHeight  = [[UIScreen mainScreen] bounds].size.height;
    
    float ratioWidth    = (imageWidth/deviceWidth);
    float ratioHeight   = (imageHeight/deviceHeight);
    
    return image;
}
*/

+ (float) getImageWidthRatio:(UIImage*)image
{
    float imageWidth    = image.size.width;
    float deviceWidth   = [[UIScreen mainScreen] bounds].size.width;
    float ratioWidth    = (imageWidth/deviceWidth);
    return ratioWidth;
}

+ (float) getImageHeightRatio:(UIImage*)image
{
    float imageHeight    = image.size.height;
    float deviceHeight   = [[UIScreen mainScreen] bounds].size.height;
    float ratioHeight    = (imageHeight/deviceHeight);
    return ratioHeight;
}

+ (float) getImageSizeWidthRatio:(UIImage*)image
{
    return [Htills getImageWidthRatio:image] * image.size.width;
}

+ (float) getImageSizeHeightRatio:(UIImage*)image
{
    return [Htills getImageHeightRatio:image] * image.size.height;
}

+ (CGSize) getImageRatioSize:(UIImage*)image
{
    CGSize imageSize = CGSizeZero;
    BOOL isWidth = NO;
    
    isWidth = image.size.width > image.size.height ? YES : NO;
    
    if (isWidth)
    {
        float ratio = [Htills getImageSizeWidthRatio:image];
        imageSize = CGSizeMake(image.size.width * ratio,
                               image.size.height * ratio);
    }
    else
    {
        float ratio = [Htills getImageHeightRatio:image];
        imageSize = CGSizeMake(image.size.width * ratio,
                               image.size.height * ratio);
        
    }
    
    
    return imageSize;
}
@end











