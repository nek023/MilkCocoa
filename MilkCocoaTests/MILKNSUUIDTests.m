//
//  MILKNSUUIDTests.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/18.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSUUID.h"

SpecBegin(MILKNSUUIDTests)

describe(@"MILKNSUUID", ^{

    it(@"should be initialized and have an UUID string", ^{
        MILKNSUUID *UUID = [MILKNSUUID UUID];
        
        expect(UUID).notTo.beNil();
        expect([UUID UUIDString]).notTo.beNil();
    });
    
    it(@"should be initialized with UUID string", ^{
        NSString *UUIDString = @"01234567-89AB-CDEF-0123-456789ABCDEF";
        MILKNSUUID *UUID = [[MILKNSUUID alloc] initWithUUIDString:UUIDString];
        
        expect(UUID).notTo.beNil();
        
        // Test generated UUID string
        expect([UUID UUIDString]).to.equal(UUIDString);
        
        // Test generated UUID bytes
        uuid_t generatedUUIDBytes;
        [UUID getUUIDBytes:generatedUUIDBytes];
        
        uuid_t UUIDBytes = {
            1, 35, 69, 103, 137, 171, 205, 239,
            1, 35, 69, 103, 137, 171, 205, 239
        };
        
        for (NSInteger i = 0; i < 16; i++) {
            NSInteger actual = generatedUUIDBytes[i];
            NSInteger expected = UUIDBytes[i];
            
            expect(actual).to.equal(expected);
        }
    });
    
    it(@"should be initialized with UUID bytes", ^{
        uuid_t UUIDBytes = {
            1, 35, 69, 103, 137, 171, 205, 239,
            1, 35, 69, 103, 137, 171, 205, 239
        };
        MILKNSUUID *UUID = [[MILKNSUUID alloc] initWithUUIDBytes:UUIDBytes];
        
        expect(UUID).notTo.beNil();
        
        // Test generated UUID string
        expect([UUID UUIDString]).to.equal(@"01234567-89AB-CDEF-0123-456789ABCDEF");
        
        // Test generated UUID bytes
        uuid_t generatedUUIDBytes;
        [UUID getUUIDBytes:generatedUUIDBytes];
        
        for (NSInteger i = 0; i < 16; i++) {
            NSInteger actual = generatedUUIDBytes[i];
            NSInteger expected = UUIDBytes[i];
            
            expect(actual).to.equal(expected);
        }
    });
    
});

SpecEnd
