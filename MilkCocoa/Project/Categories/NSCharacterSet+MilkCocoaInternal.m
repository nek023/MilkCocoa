//
//  NSCharacterSet+MilkCocoaInternal.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSCharacterSet+MilkCocoaInternal.h"

#define UNICHAR_MAX ((1ull << (CHAR_BIT * sizeof(unichar))) - 1)

@implementation NSCharacterSet (MilkCocoaInternal)

#pragma mark - Extracting All Characters

- (NSArray *)milk_allCharacters
{
    NSMutableArray *allCharacters = [NSMutableArray array];
    
    const uint8_t *bytes = (const uint8_t *)[[self bitmapRepresentation] bytes];
    for (unichar i = 0; i < UNICHAR_MAX; i++) {
        if (bytes[i >> 3] & (1u << (i & 7))) {
            [allCharacters addObject:[NSString stringWithCharacters:&i length:1]];
        }
    }
    
    return [allCharacters copy];
}

@end
