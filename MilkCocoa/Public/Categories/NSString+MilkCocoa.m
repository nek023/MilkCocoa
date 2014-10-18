//
//  NSString+MilkCocoa.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSString+MilkCocoa.h"

#import "NSCharacterSet+MilkCocoaInternal.h"

@implementation NSString (MilkCocoa)

- (NSString *)milk_stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacter
{
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        return [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacter];
    } else {
        NSString *charactersToLeaveUnescaped = [[allowedCharacter milk_allCharacters] componentsJoinedByString:@""];
        
        return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                     (__bridge CFStringRef)self,
                                                                                     (__bridge CFStringRef)charactersToLeaveUnescaped,
                                                                                     NULL,
                                                                                     kCFStringEncodingUTF8);
    }
}

- (NSString *)milk_stringByRemovingPercentEncoding
{
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
        return (__bridge_transfer NSString *)(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                      (__bridge CFStringRef)self,
                                                                                                      CFSTR(""),
                                                                                                      kCFStringEncodingUTF8));
    }
}

@end
