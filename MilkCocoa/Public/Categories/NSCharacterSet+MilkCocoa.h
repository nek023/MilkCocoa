//
//  NSCharacterSet+MilkCocoa.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (MilkCocoa)

+ (NSCharacterSet *)milk_URLFragmentAllowedCharacterSet;
+ (NSCharacterSet *)milk_URLHostAllowedCharacterSet;
+ (NSCharacterSet *)milk_URLPasswordAllowedCharacterSet;
+ (NSCharacterSet *)milk_URLPathAllowedCharacterSet;
+ (NSCharacterSet *)milk_URLQueryAllowedCharacterSet;
+ (NSCharacterSet *)milk_URLUserAllowedCharacterSet;

@end
