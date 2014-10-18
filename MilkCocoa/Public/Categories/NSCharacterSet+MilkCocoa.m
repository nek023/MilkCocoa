//
//  NSCharacterSet+MilkCocoa.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSCharacterSet+MilkCocoa.h"

@implementation NSCharacterSet (MilkCocoa)

#pragma mark - Creating a Character Set for URL Encoding

+ (NSCharacterSet *)milk_URLFragmentAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLFragmentAllowedCharacterSet)]) {
        return [self URLFragmentAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    }
}

+ (NSCharacterSet *)milk_URLHostAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLHostAllowedCharacterSet)]) {
        return [self URLHostAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-.0123456789:;=ABCDEFGHIJKLMNOPQRSTUVWXYZ[]_abcdefghijklmnopqrstuvwxyz~"];
    }
}

+ (NSCharacterSet *)milk_URLPasswordAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLPasswordAllowedCharacterSet)]) {
        return [self URLPasswordAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-.0123456789;=ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    }
}

+ (NSCharacterSet *)milk_URLPathAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLPathAllowedCharacterSet)]) {
        return [self URLPathAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./0123456789:=@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    }
}

+ (NSCharacterSet *)milk_URLQueryAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLQueryAllowedCharacterSet)]) {
        return [self URLQueryAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    }
}

+ (NSCharacterSet *)milk_URLUserAllowedCharacterSet
{
    if ([self respondsToSelector:@selector(URLUserAllowedCharacterSet)]) {
        return [self URLUserAllowedCharacterSet];
    } else {
        return [NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-.0123456789;=ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    }
}

@end
