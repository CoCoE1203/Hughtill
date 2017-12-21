//
//  NSString+Htills.h
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(Htills)

//마지막 문자 제거
- (NSString*) removeLastString;

//마지막 글자수(count)만큼 문자 제거
- (NSString*) removeCountStringWithlengthCount:(int)count;

//문자열안의 특정 텍스트(before)를 변경(afterString)
- (NSString*) setChangeString:(NSString*)beforeString afterString:(NSString*)afterString;

//특정텍스트 삭제
- (NSString*) removeString:(NSString*)string;

//문자열안의 특정 텍스트(standard)를 기준으로 NSArray에 담기
- (NSArray*) getDivisionStringWithStandardString:(NSString*)standardString;

//문자열안의 특정 텍스트 색상 변경
- (NSAttributedString*) setCertainStringChangeColorWithString:(NSString*)string color:(UIColor*)color;

//문자열안의 특정 텍스트 폰트 변경
- (NSAttributedString*) setCertainStringChangeFontWithString:(NSString*)string font:(UIFont*)font;

//천단위 , 붙여주기 [ex) 10,000]
- (NSString*) moneyLine;

//자간
- (NSAttributedString*) setLetterSpaceWithSize:(CGFloat)size;

//특정범위 자간
- (NSAttributedString*) setLetterSpaceWithSize:(CGFloat)size rangeString:(NSString*)string;

@end
