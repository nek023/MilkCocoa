//
//  MILKNSURLComponentsTests.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSURLQueryItem.h"
#import "MILKNSURLComponents.h"

SpecBegin(MILKNSURLComponentsTests)

describe(@"MILKNSURLComponents", ^{
    
    it(@"should parse URL", ^{
        NSString *string = @"http://user:password@example.com:8080/foo/bar.html?name1=value1&name2=value2#fragment1%2Bfragment2";
        MILKNSURLComponents *components = [MILKNSURLComponents componentsWithString:string];
        
        expect(components).notTo.beNil();
        
        expect(components.fragment).to.equal(@"fragment1+fragment2");
        expect(components.host).to.equal(@"example.com");
        expect(components.password).to.equal(@"password");
        expect(components.path).to.equal(@"/foo/bar.html");
        expect(components.port).to.equal(@(8080));
        expect(components.query).to.equal(@"name1=value1&name2=value2");
        expect(components.scheme).to.equal(@"http");
        expect(components.user).to.equal(@"user");
        
        NSArray *queryItems = @[
                                [MILKNSURLQueryItem queryItemWithName:@"name1" value:@"value1"],
                                [MILKNSURLQueryItem queryItemWithName:@"name2" value:@"value2"]
                                ];
        expect(components.queryItems).to.equal(queryItems);
        
        expect(components.percentEncodedFragment).to.equal(@"fragment1%2Bfragment2");
        expect(components.percentEncodedHost).to.equal(@"example.com");
        expect(components.percentEncodedPassword).to.equal(@"password");
        expect(components.percentEncodedPath).to.equal(@"/foo/bar.html");
        expect(components.percentEncodedQuery).to.equal(@"name1=value1&name2=value2");
        expect(components.percentEncodedUser).to.equal(@"user");
    });
    
    it(@"should have an option to resolve against base URL", ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://user:password@example.com:8080"];
        NSURL *URL = [NSURL URLWithString:@"/foo/bar.html?name=value#fragment" relativeToURL:baseURL];
        MILKNSURLComponents *components = [MILKNSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:NO];
        
        expect(components.fragment).to.equal(@"fragment");
        expect(components.host).to.beNil();
        expect(components.password).to.beNil();
        expect(components.path).to.equal(@"/foo/bar.html");
        expect(components.port).to.beNil();
        expect(components.query).to.equal(@"name=value");
        expect(components.scheme).to.beNil();
        expect(components.user).to.beNil();
        
        expect(components.percentEncodedFragment).to.equal(@"fragment");
        expect(components.percentEncodedHost).to.beNil();
        expect(components.percentEncodedPassword).to.beNil();
        expect(components.percentEncodedPath).to.equal(@"/foo/bar.html");
        expect(components.percentEncodedQuery).to.equal(@"name=value");
        expect(components.percentEncodedUser).to.beNil();
    
    });
    
    it(@"should construct URL", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.scheme = @"http";
        components.host = @"example.com";
        
        NSString *expected = @"http://example.com";
        expect(components.string).to.equal(expected);
        expect(components.URL).to.equal([NSURL URLWithString:expected]);
    });

    it(@"should accept nil scheme", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.host = @"example.com";
        
        expect(components.string).to.equal(@"//example.com");
    });
    
    it(@"should accept nil host", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.scheme = @"http";
        expect(components.string).to.equal(@"http:");
        
        components.path = @"/foo/bar/baz.html";
        expect(components.string).to.equal(@"http:/foo/bar/baz.html");
        
        components.user = @"user";
        components.password = @"password";
        components.port = @(8080);
        expect(components.string).to.equal(@"http://user:password@:8080/foo/bar/baz.html");
    });
    
    it(@"should construct URL with user", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.scheme = @"http";
        components.host = @"example.com";
        components.user = @"user";
        
        expect(components.string).to.equal(@"http://user@example.com");
    });
    
    it(@"should construct URL with password", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.scheme = @"http";
        components.host = @"example.com";
        components.password = @"password";
        
        expect(components.string).to.equal(@"http://:password@example.com");
    });
    
    it(@"should construct URL with user and password", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.scheme = @"http";
        components.host = @"example.com";
        components.user = @"user";
        components.password = @"password";
        
        expect(components.string).to.equal(@"http://user:password@example.com");
    });
    
    it(@"should decode percentEncodedFragment", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedFragment = @"foo%2Bbar";
        
        expect(components.fragment).to.equal(@"foo+bar");
    });
    
    it(@"should decode percentEncodedHost", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedHost = @"foo%2Bbar";
        
        expect(components.host).to.equal(@"foo+bar");
    });
    
    it(@"should decode percentEncodedPassword", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedPassword = @"foo%2Bbar";
        
        expect(components.password).to.equal(@"foo+bar");
    });
    
    it(@"should decode percentEncodedPath", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedPath = @"foo%2Bbar";
        
        expect(components.path).to.equal(@"foo+bar");
    });
    
    it(@"should decode percentEncodedQuery", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedQuery = @"foo%2Bbar";
        
        expect(components.query).to.equal(@"foo+bar");
    });
    
    it(@"should decode percentEncodedUser", ^{
        MILKNSURLComponents *components = [MILKNSURLComponents new];
        components.percentEncodedUser = @"foo%2Bbar";
        
        expect(components.user).to.equal(@"foo+bar");
    });
    
});

SpecEnd
