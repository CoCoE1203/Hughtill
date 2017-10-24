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
        return [Htills checkArray:responseObject];
    }
    
    else if ([responseObject isKindOfClass:[NSMutableDictionary class]] || [responseObject isKindOfClass:[NSDictionary class]])
    {
        return [Htills checkDictionary:responseObject];
    }
    else return [Htills checkWithNullData:responseObject];
}

+ (id) checkDictionary:(id)dictionary
{
    if ([dictionary isKindOfClass:[NSMutableDictionary class]] || [dictionary isKindOfClass:[NSDictionary class]])
    {
        NSMutableDictionary* decodeDictionary = [NSMutableDictionary new];
        NSDictionary* object = dictionary;
        NSArray* objectValue = object.allValues;
        NSArray* objectKeys  = object.allKeys;
        
        int count = 0;
        for (id value in objectValue)
        {
            if ([value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
            {
                //dictionary안에 dictionary발견
                [decodeDictionary setObject:[Htills checkDictionary:value] forKey:objectKeys[count]];
            }
            else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSArray class]])
            {
                //dictionary안에 array발견
                [decodeDictionary setObject:[Htills checkArray:value] forKey:objectKeys[count]];
            }
            else
                [decodeDictionary setObject:[Htills checkWithNullData:value] forKey:objectKeys[count]];
            count++;
        }
        
        return decodeDictionary;
        
    }
    else return dictionary;
}

+ (id) checkArray:(id)array
{
    if ([array isKindOfClass:[NSMutableArray class]] || [array isKindOfClass:[NSArray class]])
    {
        NSMutableArray* decodeArray = [NSMutableArray new];
        for (id value in array)
        {
            if ([value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
            {
                //array안에 dictionary발견
                [decodeArray addObject:[Htills checkDictionary:value]];
            }
            else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSArray class]])
            {
                //array안에 array발견
                [decodeArray addObject:[Htills checkArray:value]];
            }
            else//null check
                [decodeArray addObject:[Htills checkWithNullData:value]];
        }
        return decodeArray;
    }
    else return array;
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
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSMutableString class]])
    {
        NSString* stringValue = value;
        if (stringValue.length <= 0) return NO;
        
        if (    [value isEqualToString:@"null"]     ||
            [value isEqualToString:@"NULL"]     ||
            [value isEqualToString:@"<null>"]   ||
            [value isEqualToString:@"<NULL>"]   )   return YES;
    }
    else if ([value isKindOfClass:[NSNull class]]) return YES;
    
    return NO;
}

@end











