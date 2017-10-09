//
//  NSString+Htills.m
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "NSString+Htills.h"

@implementation NSString(Htills)

//마지막 문자 제거
- (NSString*) removeLastString
{
    return [self removeCountStringWithlengthCount:1];
}

//마지막 글자수(count)만큼 문자 제거
- (NSString*) removeCountStringWithlengthCount:(int)count
{
    NSString *newString = [self substringToIndex:[self length]-count];
    return newString;
}

//문자열안의 특정 텍스트(before)를 변경(afterString)
- (NSString*) setChangeString:(NSString*)beforeString afterString:(NSString*)afterString
{
    return [self stringByReplacingOccurrencesOfString:beforeString withString:afterString];
}

//문자열안의 특정 텍스트(standard)를 기준으로 NSArray에 담기
- (NSArray*) getDivisionStringWithStandardString:(NSString*)standardString
{
    return [self componentsSeparatedByString:standardString];
}

//문자열안의 특정 텍스트 색상 변경
- (NSAttributedString*) setCertainStringChangeColorWithString:(NSString*)string color:(UIColor*)color
{
    //문자열 설정
    NSMutableAttributedString* att = [[NSMutableAttributedString alloc] initWithString:self];
    
    //변화시킬 범위를 설정
    NSRange range = [self rangeOfString:string];
    
    //변화종류, 옵션 설정
    [att addAttribute:NSForegroundColorAttributeName
                value:[color colorWithAlphaComponent:1.0f]//[UIColor brownColor]만 해도 사용이 가능합니다
                range:range];
    return att;
    //설정내용으로 라벨 변경
    //[label setAttributedText:att];//적용법
}

//문자열안의 특정 텍스트 폰트 변경
- (NSAttributedString*) setCertainStringChangeFontWithString:(NSString*)string font:(UIFont*)font
{
    //문자열 설정
    NSMutableAttributedString* att = [[NSMutableAttributedString alloc] initWithString:self];
    
    //변화시킬 범위를 설정
    NSRange range = [self rangeOfString:string];
    
    //변화종류, 옵션 설정
    [att addAttribute:NSFontAttributeName
                value:font
                range:range];
    
    return att;
    //설정내용으로 라벨 변경
    //[label setAttributedText:att];//적용법
}

//천단위 , 붙여주기 [ex) 10,000]
- (NSString*) moneyLine
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setGroupingSeparator:@","];
    [numberFormatter setGroupingSize:3];
    [numberFormatter setUsesGroupingSeparator:YES];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *theString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:self.doubleValue]];
    return theString;
}

//자간
- (NSAttributedString*) setLetterSpaceWithSize:(CGFloat)size
{
    return [self setLetterSpaceWithSize:size rangeString:self];
}

//특정범위 자간
- (NSAttributedString*) setLetterSpaceWithSize:(CGFloat)size rangeString:(NSString*)string
{
    //문자열 설정
    NSMutableAttributedString* att = [[NSMutableAttributedString alloc] initWithString:self];
    
    //변화시킬 범위를 설정
    NSRange range = [self rangeOfString:string];

    [att addAttribute:NSKernAttributeName
                value:[NSNumber numberWithFloat:size]
                range:range];
    
    return att;
    //설정내용으로 라벨 변경
    //[label setAttributedText:att];//적용법
}


@end
