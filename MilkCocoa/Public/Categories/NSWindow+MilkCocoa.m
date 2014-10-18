//
//  NSWindow+MilkCocoa.m
//  MilkCocoa
//
//  Created by Katsuma Tanaka on 2014/10/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "NSWindow+MilkCocoa.h"
#import <objc/runtime.h>

#import "NSProcessInfo+MilkCocoa.h"

static char kMilkCocoaModalCompletionHandlerKey;

@implementation NSWindow (MilkCocoa)

#pragma mark - Accessors

- (void)milk_setModalCompletionHandler:(void (^)(MILKNSModalResponse returnCode))handler
{
    objc_setAssociatedObject(self, &kMilkCocoaModalCompletionHandlerKey, handler, OBJC_ASSOCIATION_COPY);
}

- (void (^)(MILKNSModalResponse returnCode))milk_modalCompletionHandler
{
    return objc_getAssociatedObject(self, &kMilkCocoaModalCompletionHandlerKey);
}


#pragma mark - Managing Sheets

- (void)milk_beginSheet:(NSWindow *)sheetWindow completionHandler:(void (^)(MILKNSModalResponse returnCode))handler
{
    if ([self respondsToSelector:@selector(beginSheet:completionHandler:)]) {
        [self beginSheet:sheetWindow completionHandler:handler];
    } else {
        [self milk_setModalCompletionHandler:handler];
        
        [NSApp beginSheet:sheetWindow
           modalForWindow:self
            modalDelegate:self
           didEndSelector:@selector(milk_sheetDidEnd:returnCode:contextInfo:)
              contextInfo:nil];
    }
}

- (void)milk_endSheet:(NSWindow *)sheetWindow
{
    if ([self respondsToSelector:@selector(endSheet:)]) {
        [self endSheet:sheetWindow];
    } else {
        [NSApp endSheet:sheetWindow];
    }
}

- (void)milk_endSheet:(NSWindow *)sheetWindow returnCode:(MILKNSModalResponse)returnCode
{
    if ([self respondsToSelector:@selector(endSheet:returnCode:)]) {
        [self endSheet:sheetWindow returnCode:returnCode];
    } else {
        [NSApp endSheet:sheetWindow returnCode:returnCode];
    }
}


#pragma mark - NSApplicationModalDelegate

- (void)milk_sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    void (^handler)(NSInteger returnCode) = [self milk_modalCompletionHandler];
    if (handler) {
        handler(returnCode);
    }
    
    [self milk_setModalCompletionHandler:nil];
}

@end
