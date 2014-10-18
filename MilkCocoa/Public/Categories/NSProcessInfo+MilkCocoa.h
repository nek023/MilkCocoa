//
//  NSProcessInfo+MilkCocoa.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    NSInteger majorVersion;
    NSInteger minorVersion;
    NSInteger patchVersion;
} MILKNSOperatingSystemVersion;

@interface NSProcessInfo (MilkCocoa)

- (MILKNSOperatingSystemVersion)milk_operatingSystemVersion;
- (BOOL)milk_isOperatingSystemAtLeastVersion:(MILKNSOperatingSystemVersion)version;

@end
