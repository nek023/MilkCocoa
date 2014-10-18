//
//  NSString+MilkCocoa.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MilkCocoa)

- (NSString *)milk_stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacter;
- (NSString *)milk_stringByRemovingPercentEncoding;

@end
