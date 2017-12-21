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

+ (CGSize) getSizeRatioSize:(CGSize)size
{
    CGSize imageSize = CGSizeZero;
    BOOL isWidth = NO;
    
    isWidth = size.width > [[UIScreen mainScreen] bounds].size.width ? YES : NO;
    
    if (isWidth)
    {
        float ratio = [Htills getSizeWidthRatio:size];
        imageSize = CGSizeMake(size.width * ratio,
                               size.height * ratio);
    }
    else
    {
        float ratio = [Htills getSizeHeightRatio:size];
        imageSize = CGSizeMake(size.width * ratio,
                               size.height * ratio);
        
    }
    return imageSize;
}

+ (float) getSizeWidthRatio:(CGSize)size
{
    float imageWidth    = size.width;
    float deviceWidth   = [[UIScreen mainScreen] bounds].size.width;
    float ratioWidth    = (deviceWidth/imageWidth);
    return ratioWidth;
}

+ (float) getSizeHeightRatio:(CGSize)size
{
    float imageHeight    = size.height;
    float deviceHeight   = [[UIScreen mainScreen] bounds].size.height;
    float ratioHeight    = (deviceHeight/imageHeight);
    return ratioHeight;
}

+ (float) getImageWidthRatio:(UIImage*)image
{
    return [Htills getSizeWidthRatio:image.size];
}

+ (float) getImageHeightRatio:(UIImage*)image
{
    return [Htills getSizeHeightRatio:image.size];
}

+ (float) getImageSizeWidthRatio:(UIImage*)image
{
    return [Htills getSizeWidthRatio:image.size] * image.size.width;
}

+ (float) getImageSizeHeightRatio:(UIImage*)image
{
    return [Htills getSizeHeightRatio:image.size] * image.size.height;
}

+ (CGSize) getImageRatioSize:(UIImage*)image
{
    CGSize imageSize = CGSizeZero;
    BOOL isWidth = NO;
    
    isWidth = image.size.width > image.size.height ? YES : NO;
    
    if (isWidth)
    {
        float ratio = [Htills getSizeWidthRatio:image.size];
        imageSize = CGSizeMake(image.size.width * ratio,
                               image.size.height * ratio);
    }
    else
    {
        float ratio = [Htills getSizeHeightRatio:image.size];
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
        
        if (
            [value isEqualToString:@"null"]     ||
            [value isEqualToString:@"NULL"]     ||
            [value isEqualToString:@"<null>"]   ||
            [value isEqualToString:@"<NULL>"]
            )   return YES;
    }
    else if ([value isKindOfClass:[NSNull class]]) return YES;
    
    return NO;
}


- (CGFloat)getLabelHeight:(UILabel*)label
{
    CGSize constraint = CGSizeMake(label.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [label.text boundingRectWithSize:constraint
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:label.font}
                                                  context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height;
}

//alert

+ (void) makeBottomAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction *_Nullable action))handler
{
    //(OK)
    [self makeAlertWithViewController:viewController
                                title:title
                              message:message
                              handler:handler
                                style:UIAlertControllerStyleActionSheet];
}

+ (void) makeCenterAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler
{
    //(OK)
    [self makeAlertWithViewController:viewController
                                title:title
                              message:message
                              handler:handler
                                style:UIAlertControllerStyleAlert];
}

//1. No Button, No action.(OK)
+ (void) makeNobuttonAlertWithViewController:(UIViewController*_Nonnull)viewController
                                       title:(NSString*_Nullable)title
                                     message:(NSString*_Nullable)message
                                       delay:(float)delay
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    [viewController presentViewController:alert animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

//2. normal style (OK)
+ (void) makeAlertWithViewController:(UIViewController*_Nonnull)viewController
                               title:(NSString*_Nullable)title
                             message:(NSString*_Nullable)message
                             handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler
                               style:(UIAlertControllerStyle)style
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:style];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             if (handler)
                                 handler(action);
                             
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end











