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

//이미지 비율
+ (float) getImageSizeWidthRatio:(UIImage*)image;
+ (float) getImageSizeHeightRatio:(UIImage*)image;

@end
