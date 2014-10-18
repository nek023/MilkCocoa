//
//  NSProcessInfo+MilkCocoa.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSProcessInfo+MilkCocoa.h"

@implementation NSProcessInfo (MilkCocoa)

#pragma mark - Getting Host Information

- (MILKNSOperatingSystemVersion)milk_operatingSystemVersion
{
    SEL selector = NSSelectorFromString(@"operatingSystemVersion");
    
    if ([[NSProcessInfo processInfo] respondsToSelector:selector]) {
        MILKNSOperatingSystemVersion (*method)(id, SEL) = (MILKNSOperatingSystemVersion (*)(id, SEL))[self methodForSelector:selector];
        MILKNSOperatingSystemVersion version = method(self, selector);
        
        return version;
    } else {
        NSDictionary *systemVersion = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
        NSString *productVersion = systemVersion[@"ProductVersion"];
        NSArray *components = [productVersion componentsSeparatedByString:@"."];
        
        return (MILKNSOperatingSystemVersion) {
            .majorVersion = [components[0] integerValue],
            .minorVersion = [components[1] integerValue],
            .patchVersion = [components[2] integerValue]
        };
    }
}

- (BOOL)milk_isOperatingSystemAtLeastVersion:(MILKNSOperatingSystemVersion)version
{
    SEL selector = NSSelectorFromString(@"isOperatingSystemAtLeastVersion:");
    
    if ([[NSProcessInfo processInfo] respondsToSelector:selector]) {
        BOOL (*method)(id, SEL, MILKNSOperatingSystemVersion) = (BOOL (*)(id, SEL, MILKNSOperatingSystemVersion))[self methodForSelector:selector];
        
        return method(self, selector, version);
    } else {
        MILKNSOperatingSystemVersion currentVersion = [self milk_operatingSystemVersion];
        
        return (currentVersion.majorVersion > version.majorVersion
                || (currentVersion.majorVersion == version.majorVersion
                    && (currentVersion.minorVersion > version.minorVersion
                        || (currentVersion.minorVersion == version.minorVersion
                            && currentVersion.patchVersion >= version.patchVersion))));
    }
}

@end
