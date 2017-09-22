//
//  NSString+Htills.h
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Htills)

//마지막 문자 제거
- (NSString*) removeLastString;

//마지막 글자수(count)만큼 문자 제거
- (NSString*) removeCountStringWithlengthCount:(int)count;

@end
