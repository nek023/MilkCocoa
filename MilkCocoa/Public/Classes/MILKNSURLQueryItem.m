//
//  MILKNSURLQueryItem.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "MILKNSURLQueryItem.h"

@interface MILKNSURLQueryItem ()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *value;

@end

@interface MILKNSURLQueryItem (MustBePrivate)

- (BOOL)isEqualToQueryItem:(MILKNSURLQueryItem *)queryItem;

@end

@implementation MILKNSURLQueryItem

+ (instancetype)queryItemWithName:(NSString *)name value:(NSString *)value
{
    return [[self alloc] initWithName:name value:value];
}

- (instancetype)initWithName:(NSString *)name value:(NSString *)value
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.value = value;
    }
    
    return self;
}

- (BOOL)isEqualToQueryItem:(MILKNSURLQueryItem *)queryItem
{
    return (((self.name == nil && queryItem.name == nil) || [self.name isEqualToString:queryItem.name])
            && ((self.value == nil && queryItem.value == nil) || [self.value isEqualToString:queryItem.value]));
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if ([super isEqual:other]) {
        return YES;
    } else {
        return [self isEqualToQueryItem:other];
    }
}

- (NSUInteger)hash
{
    return [self.name hash] ^ [self.value hash];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; name = %@; value = %@>",
            NSStringFromClass([self class]),
            self,
            self.name,
            self.value
            ];
}

@end
