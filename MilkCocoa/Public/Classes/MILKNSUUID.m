//
//  MILKNSUUID.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSUUID.h"

@interface MILKNSUUID ()
{
@private
    CFUUIDRef _uuid;
}

@end

@implementation MILKNSUUID

+ (instancetype)UUID
{
    return [self new];
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _uuid = CFUUIDCreate(NULL);
    }
    
    return self;
}

- (instancetype)initWithUUIDBytes:(const uuid_t)bytes
{
    self = [super init];
    
    if (self) {
        _uuid = CFUUIDCreateWithBytes(NULL, bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7], bytes[8], bytes[9], bytes[10], bytes[11], bytes[12], bytes[13], bytes[14], bytes[15]);
    }
    
    return self;
}

- (instancetype)initWithUUIDString:(NSString *)string
{
    self = [super init];
    
    if (self) {
        _uuid = CFUUIDCreateFromString(NULL, (__bridge CFStringRef)string);
    }
    
    return self;
}

- (void)dealloc
{
    CFRelease(_uuid);
}


#pragma mark - Get UUID Values

- (void)getUUIDBytes:(uuid_t)uuid
{
    CFUUIDBytes bytes = CFUUIDGetUUIDBytes(_uuid);
    uuid[0] = bytes.byte0;
    uuid[1] = bytes.byte1;
    uuid[2] = bytes.byte2;
    uuid[3] = bytes.byte3;
    uuid[4] = bytes.byte4;
    uuid[5] = bytes.byte5;
    uuid[6] = bytes.byte6;
    uuid[7] = bytes.byte7;
    uuid[8] = bytes.byte8;
    uuid[9] = bytes.byte9;
    uuid[10] = bytes.byte10;
    uuid[11] = bytes.byte11;
    uuid[12] = bytes.byte12;
    uuid[13] = bytes.byte13;
    uuid[14] = bytes.byte14;
    uuid[15] = bytes.byte15;
}

- (NSString *)UUIDString
{
    return (__bridge_transfer NSString *)CFUUIDCreateString(NULL, _uuid);
}

@end
