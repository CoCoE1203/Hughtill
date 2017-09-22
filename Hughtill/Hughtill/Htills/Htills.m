//
//  Htills.m
//  Hughtill
//
//  Created by Burn on 2017. 9. 22..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "Htills.h"

@implementation Htills

+ (NSString*) removeLastString:(NSString*)string
{
    return [Htills removeCountString:string lengthCount:1];
}

+ (NSString*) removeCountString:(NSString*)string lengthCount:(int)count
{
    NSString *newString = [string substringToIndex:[string length]-count];    
    return newString;
}



@end

