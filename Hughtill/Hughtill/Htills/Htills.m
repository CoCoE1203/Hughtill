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
    float ratioWidth    = (deviceWidth/imageWidth);
    return ratioWidth;
}

+ (float) getImageHeightRatio:(UIImage*)image
{
    float imageHeight    = image.size.height;
    float deviceHeight   = [[UIScreen mainScreen] bounds].size.height;
    float ratioHeight    = (deviceHeight/imageHeight);
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
        float ratio = [Htills getImageWidthRatio:image];
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

//null check
+ (id) requestDecode:(id)responseObject
{
    if ([responseObject isKindOfClass:[NSArray class]] || [responseObject isKindOfClass:[NSMutableArray class]])
    {
        NSMutableArray* decodeArray = [NSMutableArray new];
        for (id value in responseObject)
        {
            [decodeArray addObject:[Htills checkWithNullData:value]];
        }
        return decodeArray;
    }
    
    else if ([responseObject isKindOfClass:[NSMutableDictionary class]] || [responseObject isKindOfClass:[NSDictionary class]])
    {
        NSMutableDictionary* decodeDictionary = [NSMutableDictionary new];
        NSDictionary* object = responseObject;
        NSArray* objectValue = object.allValues;
        NSArray* objectKeys  = object.allKeys;
        
        int count = 0;
        for (id value in objectValue)
        {
            if ([value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
            {
                
            }
            [decodeDictionary setObject:[Htills checkWithNullData:value] forKey:objectKeys[count]];
            count++;
        }
        
        
        return decodeDictionary;
    }
    
    else return nil;
}

+ (id) checkWithNullData:(id)value
{
    if ([Htills checkStringValue:value])
    {
        //null check 빈값이 들어왔습니다
        return [NSNull null];
    }
    return value;
}

+ (BOOL) checkStringValue:(id)value
{
    if ([value isKindOfClass:[NSString class]])
    {
        NSString* stringValue = value;
        if (stringValue.length <= 0) return NO;
        
        if (    [value isEqualToString:@"null"]     ||
                [value isEqualToString:@"NULL"]     ||
                [value isEqualToString:@"<null>"]   ||
                [value isEqualToString:@"<NULL>"]   )   return YES;
    }
    return NO;
}

@end











