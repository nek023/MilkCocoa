//
//  MILKNSURLComponents.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSURLComponents.h"

#import "NSCharacterSet+MilkCocoa.h"
#import "NSString+MilkCocoa.h"
#import "MILKNSURLQueryItem.h"

@implementation MILKNSURLComponents

+ (instancetype)componentsWithString:(NSString *)string
{
    return [[self alloc] initWithString:string];
}

+ (instancetype)componentsWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
    return [[self alloc] initWithURL:url resolvingAgainstBaseURL:resolve];
}

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    
    if (self) {
        [self parseURL:[NSURL URLWithString:string]];
    }
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve
{
    self = [super init];
    
    if (self) {
        if (resolve && url.baseURL) [self parseURL:url.baseURL];
        else [self parseURL:[NSURL URLWithString:url.relativeString]];
    }
    
    return self;
}

- (void)parseURL:(NSURL *)url
{
    // Set native format properties
    self.fragment = [url.fragment milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLFragmentAllowedCharacterSet]];
    self.host = [url.host milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLHostAllowedCharacterSet]];
    self.password = [url.password milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLPasswordAllowedCharacterSet]];
    self.path = [url.path milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLPathAllowedCharacterSet]];
    self.port = url.port;
    self.query = [url.query milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLQueryAllowedCharacterSet]];
    self.scheme = url.scheme;
    self.user = [url.user milk_stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet milk_URLUserAllowedCharacterSet]];
    
    // Parse query items
    NSMutableArray *queryItems = [NSMutableArray array];
    
    for (NSString *pair in [url.query componentsSeparatedByString:@"&"]) {
        NSArray *components = [pair componentsSeparatedByString:@"="];
        
        if (components.count == 2) {
            [queryItems addObject:[MILKNSURLQueryItem queryItemWithName:components[0] value:components[1]]];
        } else if (components.count == 1) {
            [queryItems addObject:[MILKNSURLQueryItem queryItemWithName:components[0] value:nil]];
        }
    }
    
    self.queryItems = [queryItems copy];
    
    // Set URL-encoded format properties
    self.percentEncodedFragment = url.fragment;
    self.percentEncodedHost = url.host;
    self.percentEncodedPassword = url.password;
    self.percentEncodedPath = url.path;
    self.percentEncodedQuery = url.query;
    self.percentEncodedUser = url.user;
}


#pragma mark - Obtaining a URL

- (NSString *)string
{
    NSMutableString *string = [NSMutableString string];
    
    if (self.scheme) [string appendFormat:@"%@:", self.scheme];
    if (self.host || self.user || self.password || self.port) [string appendString:@"//"];
    if (self.user) [string appendString:self.user];
    if (self.password) [string appendFormat:@":%@", self.password];
    if (self.user || self.password) [string appendString:@"@"];
    if (self.host) [string appendString:self.host];
    if (self.port) [string appendFormat:@":%@", self.port];
    if (self.path) {
        if (![self.path hasPrefix:@"/"] && self.host) {
            return nil;
        } else {
            [string appendString:self.path];
        }
    }
    if (self.queryItems.count > 0) {
        [string appendString:@"?"];
        
        for (MILKNSURLQueryItem *queryItem in self.queryItems) {
            [string appendFormat:@"%@=%@", queryItem.name, queryItem.value];
        }
    }
    if (self.fragment) [string appendString:self.fragment];
    
    return [string copy];
}

- (NSURL *)URL
{
    return [NSURL URLWithString:self.string];
}

- (NSURL *)URLRelativeToURL:(NSURL *)baseURL
{
    return [NSURL URLWithString:self.string relativeToURL:baseURL];
}


#pragma mark - Properties in Native Format

- (void)setFragment:(NSString *)fragment
{
    _fragment = fragment;
}


#pragma mark - Properties in URL-Encoded Format

- (void)setPercentEncodedFragment:(NSString *)percentEncodedFragment
{
    _percentEncodedFragment = percentEncodedFragment;
    
    self.fragment = [percentEncodedFragment milk_stringByRemovingPercentEncoding];
}

- (void)setPercentEncodedHost:(NSString *)percentEncodedHost
{
    _percentEncodedHost = percentEncodedHost;
    
    self.host = [percentEncodedHost milk_stringByRemovingPercentEncoding];
}

- (void)setPercentEncodedPassword:(NSString *)percentEncodedPassword
{
    _percentEncodedPassword = percentEncodedPassword;
    
    self.password = [percentEncodedPassword milk_stringByRemovingPercentEncoding];
}

- (void)setPercentEncodedPath:(NSString *)percentEncodedPath
{
    _percentEncodedPath = percentEncodedPath;
    
    self.path = [percentEncodedPath milk_stringByRemovingPercentEncoding];
}

- (void)setPercentEncodedQuery:(NSString *)percentEncodedQuery
{
    _percentEncodedQuery = percentEncodedQuery;
    
    self.query = [percentEncodedQuery milk_stringByRemovingPercentEncoding];
}

- (void)setPercentEncodedUser:(NSString *)percentEncodedUser
{
    _percentEncodedUser = percentEncodedUser;
    
    self.user = [percentEncodedUser milk_stringByRemovingPercentEncoding];
}

@end
