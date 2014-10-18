//
//  NSWindow+MilkCocoa.h
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, MILKNSModalResponse) {
    MILKNSModalResponseStop     = (-1000),
    MILKNSModalResponseAbort    = (-1001),
    MILKNSModalResponseContinue = (-1002)
};

@interface NSWindow (MilkCocoa)

- (void)milk_beginSheet:(NSWindow *)sheetWindow completionHandler:(void (^)(MILKNSModalResponse returnCode))handler;
- (void)milk_endSheet:(NSWindow *)sheetWindow;
- (void)milk_endSheet:(NSWindow *)sheetWindow returnCode:(MILKNSModalResponse)returnCode;

@end
