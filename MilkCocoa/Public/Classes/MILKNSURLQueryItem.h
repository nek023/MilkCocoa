//
//  MILKNSURLQueryItem.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MILKNSURLQueryItem : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *value;

+ (instancetype)queryItemWithName:(NSString *)name value:(NSString *)value;
- (instancetype)initWithName:(NSString *)name value:(NSString *)value;

@end
