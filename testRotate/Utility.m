//
//  Utility.m
//  testRotate
//
//  Created by ccw on 15-5-18.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (BOOL)isEqualOrGreaterThanIOS8 {
    return ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO;
}

+ (BOOL)isEqualOrGreaterThanIOS8_3 {
    if (![self isBetweenIOS8AndIOSMajorVerion:8 minorVersion:3 patchVersion:0]) {
        if (![self isEqualOrGreaterThanIOS8]) {  // <IOS8
            return NO;
        }
        else {   //>=8.3
            return YES;
        }
    }
    else {
        return NO;
    }
}

+ (BOOL)isBetweenIOS8AndIOSMajorVerion:(NSInteger)majorVersion minorVersion:(NSInteger)minorVersion patchVersion:(NSInteger)patchVersion
{
    NSAssert(majorVersion >= 8, @"majorVersion must be equal or great than 8");
    if (![self isEqualOrGreaterThanIOS8]) {
        return NO;
    }
    
    NSOperatingSystemVersion version = (NSOperatingSystemVersion){
        .majorVersion = majorVersion,
        .minorVersion = minorVersion,
        .patchVersion = patchVersion
    };
    
    if (![[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:version])
    {
        return YES;
    }
    
    return NO;
}
@end
