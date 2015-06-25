//
//  AppDelegate.h
//  testRotate
//
//  Created by NetEase on 15-5-15.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#define APP_DELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *secWindow;

@end

