//
//  Utility.h
//  testRotate
//
//  Created by ccw on 15-5-18.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (BOOL)isEqualOrGreaterThanIOS8;
+ (BOOL)isEqualOrGreaterThanIOS8_3;
+ (BOOL)isBetweenIOS8AndIOSMajorVerion:(NSInteger)majorVersion
                          minorVersion:(NSInteger)minorVersion
                          patchVersion:(NSInteger)patchVersion;
@end
