//
//  MILKNSURLQueryItemTests.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSURLQueryItem.h"

SpecBegin(MILKNSURLQueryItemTests)

describe(@"MILKNSURLQueryItem", ^{

    it(@"should be initialized", ^{
        MILKNSURLQueryItem *queryItem = [MILKNSURLQueryItem queryItemWithName:@"name" value:@"value"];
        
        expect(queryItem).notTo.beNil();
        
        expect(queryItem.name).to.equal(@"name");
        expect(queryItem.value).to.equal(@"value");
    });
    
    it(@"should allow nil value for both name and value", ^{
        MILKNSURLQueryItem *queryItem = [MILKNSURLQueryItem queryItemWithName:nil value:nil];
        
        expect(queryItem).notTo.beNil();
        
        expect(queryItem.name).to.beNil();
        expect(queryItem.value).to.beNil();
    });
    
});

SpecEnd
