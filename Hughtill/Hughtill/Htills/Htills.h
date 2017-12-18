//
//  Htills.h
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 
@interface Htills : NSObject

//View Copy
+ (id _Nonnull ) copy:(id _Nonnull )object;

//[이미지 비율관련
//이미지 가로, 세로 사이즈와 디바이스사이즈의 비율을 반환
+ (float) getImageWidthRatio:(UIImage*_Nonnull)image;
+ (float) getImageHeightRatio:(UIImage*_Nonnull)image;
//이미지 가로, 세로 사이즈 비율을 적용한 크기를 반환
+ (float) getImageSizeWidthRatio:(UIImage*_Nonnull)image;//가로만
+ (float) getImageSizeHeightRatio:(UIImage*_Nonnull)image;//세로만
//이미지의 가로사이즈가 크면 가로사이즈의 비율만큼 Size반환, 세로가 크다면 세로비율만큼 Size반환
+ (CGSize) getImageRatioSize:(UIImage*_Nonnull)image;
//]

//null check 서버에서 내려주는 null, @"null"
+ (id _Nonnull ) requestDecode:(id _Nonnull )responseObject;


//alert

+ (void) makeBottomAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction *_Nullable action))handler;

+ (void) makeCenterAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler;

//1. No Button, No action.
+ (void) makeNobuttonAlertWithViewController:(UIViewController*_Nonnull)viewController
                                       title:(NSString*_Nullable)title
                                     message:(NSString*_Nullable)message
                                       delay:(float)delay;

//2. normal style
+ (void) makeAlertWithViewController:(UIViewController*_Nonnull)viewController
                               title:(NSString*_Nullable)title
                             message:(NSString*_Nullable)message
                             handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler
                               style:(UIAlertControllerStyle)style;

@end
