//
//  MILKNSURLComponents.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MILKNSURLComponents : NSObject

@property (nonatomic, copy, readonly) NSString *string;
@property (nonatomic, copy, readonly) NSURL *URL;

@property (nonatomic, copy) NSString *fragment;
@property (nonatomic, copy) NSString *host;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSNumber *port;
@property (nonatomic, copy) NSString *query;
@property (nonatomic, copy) NSArray *queryItems;
@property (nonatomic, copy) NSString *scheme;
@property (nonatomic, copy) NSString *user;

@property (nonatomic, copy) NSString *percentEncodedFragment;
@property (nonatomic, copy) NSString *percentEncodedHost;
@property (nonatomic, copy) NSString *percentEncodedPassword;
@property (nonatomic, copy) NSString *percentEncodedPath;
@property (nonatomic, copy) NSString *percentEncodedQuery;
@property (nonatomic, copy) NSString *percentEncodedUser;

+ (instancetype)componentsWithString:(NSString *)string;
+ (instancetype)componentsWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve;

- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithURL:(NSURL *)url resolvingAgainstBaseURL:(BOOL)resolve;

- (NSURL *)URLRelativeToURL:(NSURL *)baseURL;

@end
