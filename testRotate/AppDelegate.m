//
//  AppDelegate.m
//  testRotate
//
//  Created by NetEase on 15-5-15.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    UIViewController *presentedViewController = window.rootViewController.presentedViewController;
    if (presentedViewController) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        if ([presentedViewController isKindOfClass:[UIActivityViewController class]] || [presentedViewController isKindOfClass:[UIAlertController class]]) {
            return UIInterfaceOrientationMaskPortrait;
        }
#else
        if ([presentedViewController isKindOfClass:[UIActivityViewController class]]) {
            return UIInterfaceOrientationMaskPortrait;
        }
#endif
    }
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:frame];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
//    // Real Size + 0.000001
//    self.window.frame = CGRectMake(0, 0, frame.size.width+0.000001, frame.size.height+0.000001);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
