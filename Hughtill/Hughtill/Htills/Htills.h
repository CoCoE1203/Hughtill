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
+ (id) copy:(id)object;

//[이미지 비율관련
//이미지 가로, 세로 사이즈와 디바이스사이즈의 비율을 반환
+ (float) getImageWidthRatio:(UIImage*)image;
+ (float) getImageHeightRatio:(UIImage*)image;
//이미지 가로, 세로 사이즈 비율을 적용한 크기를 반환
+ (float) getImageSizeWidthRatio:(UIImage*)image;//가로만
+ (float) getImageSizeHeightRatio:(UIImage*)image;//세로만
//이미지의 가로사이즈가 크면 가로사이즈의 비율만큼 Size반환, 세로가 크다면 세로비율만큼 Size반환
+ (CGSize) getImageRatioSize:(UIImage*)image;
//]
@end
