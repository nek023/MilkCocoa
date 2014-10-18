//
//  MILKNSUUID.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MILKNSUUID : NSObject

+ (instancetype)UUID;

- (instancetype)init;
- (instancetype)initWithUUIDBytes:(const uuid_t)bytes;
- (instancetype)initWithUUIDString:(NSString *)string;

- (void)getUUIDBytes:(uuid_t)uuid;
- (NSString *)UUIDString;

@end
