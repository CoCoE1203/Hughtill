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

@end
