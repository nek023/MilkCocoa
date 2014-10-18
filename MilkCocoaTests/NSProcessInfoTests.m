//
//  NSProcessInfoTests.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSProcessInfo+MilkCocoa.h"

SpecBegin(NSProcessInfoTests)

describe(@"NSProcessInfo", ^{
    
    it(@"should return operating system version", ^{
        MILKNSOperatingSystemVersion actual = [[NSProcessInfo processInfo] milk_operatingSystemVersion];
        NSOperatingSystemVersion expected = [[NSProcessInfo processInfo] operatingSystemVersion];
        
        expect(actual.majorVersion).to.equal(expected.majorVersion);
        expect(actual.minorVersion).to.equal(expected.minorVersion);
        expect(actual.patchVersion).to.equal(expected.patchVersion);
    });
    
    it(@"should compare operating system version", ^{
        MILKNSOperatingSystemVersion pastVersion = (MILKNSOperatingSystemVersion) {
            .majorVersion = 10,
            .minorVersion = 6,
            .patchVersion = 0
        };
        
        MILKNSOperatingSystemVersion currentVersion = [[NSProcessInfo processInfo] milk_operatingSystemVersion];
        
        MILKNSOperatingSystemVersion futureVersion = (MILKNSOperatingSystemVersion) {
            .majorVersion = 10,
            .minorVersion = 20,
            .patchVersion = 0
        };
        
        expect([[NSProcessInfo processInfo] milk_isOperatingSystemAtLeastVersion:pastVersion]).to.beTruthy();
        expect([[NSProcessInfo processInfo] milk_isOperatingSystemAtLeastVersion:currentVersion]).to.beTruthy();
        expect([[NSProcessInfo processInfo] milk_isOperatingSystemAtLeastVersion:futureVersion]).to.beFalsy();
    });
    
});

SpecEnd
