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

/**
 2018.01.03 Hugh
 1 - Array의 값을 바꿉니다.
 */
+ (void) mutableArray:(NSMutableArray*)array ChangeObject:(id)object Index:(NSInteger)index;

/**
 2017.12.28 Hugh
 1 - 네비게이션의 첫번째 페이지를 불러옵니다
 Push Landing 할때 만들었습니다.
 */
+ (void) loadFirstPage;

/**
 View Copy
 어느 것이든 UI에 해당한다면 복제해줍니다.
 */
+ (id _Nonnull ) copy:(id _Nonnull )object;

//[이미지 비율관련
/**
 이미지 '가로' 사이즈와 디바이스사이즈의 비율을 반환
 */
+ (float) getImageWidthRatio:(UIImage*_Nonnull)image;
/**
 이미지 '세로' 사이즈와 디바이스사이즈의 비율을 반환
 */
+ (float) getImageHeightRatio:(UIImage*_Nonnull)image;

/**
 이미지 '가로'사이즈 비율을 적용한 크기를 반환
 */
+ (float) getImageSizeWidthRatio:(UIImage*_Nonnull)image;//가로만
/**
 이미지 '세로' 사이즈 비율을 적용한 크기를 반환
 */
+ (float) getImageSizeHeightRatio:(UIImage*_Nonnull)image;//세로만


/**
 이미지의 가로사이즈가 크면 가로사이즈의 비율만큼 Size반환, 세로가 크다면 세로비율만큼 Size반환
 */
+ (CGSize) getImageRatioSize:(UIImage*_Nonnull)image;
//]

/**
 null check 서버에서 내려주는 null, @"null"
 옛날 경험했던 String으로 내려주는 null과 NSNull형식으로 떨궈주는 null을 경험한뒤로 서버에서 내려받을때 사용합니다.
 */
+ (id _Nonnull ) requestDecode:(id _Nonnull )responseObject;


//Alert
/**
 기본으로 사용되는 Alert입니다. 화면 '하단'에 나타납니다. 자유롭게 변형해서 사용해주시면 됩니닷
 */
+ (void) makeBottomAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction *_Nullable action))handler;
/**
 기본으로 사용되는 Alert입니다. 화면 '중앙'에 나타납니다. 자유롭게 변형해서 사용해주시면 됩니닷
 */
+ (void) makeCenterAlertWithViewController:(UIViewController*_Nonnull)viewController
                                     title:(NSString*_Nullable)title
                                   message:(NSString*_Nullable)message
                                   handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler;


/**
 1. No Button, No action. 
 시간이 지나면 사라지는 Alert
 1 - Delay ex) Delay = 0.3f < 이 시간이 중점으로 사용됩니다
 */
+ (void) makeNobuttonAlertWithViewController:(UIViewController*_Nonnull)viewController
                                       title:(NSString*_Nullable)title
                                     message:(NSString*_Nullable)message
                                       delay:(float)delay;

/**
 2. normal style
 기본적인 YES, NO 버튼이 있는 Alert
 */
+ (void) makeAlertWithViewController:(UIViewController*_Nonnull)viewController
                               title:(NSString*_Nullable)title
                             message:(NSString*_Nullable)message
                             handler:(void (^ __nullable)(UIAlertAction * _Nullable action))handler
                               style:(UIAlertControllerStyle)style;

@end
