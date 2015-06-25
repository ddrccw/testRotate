//
//  SecondViewController.m
//  testRotate
//
//  Created by NetEase on 15-5-15.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import "SecondViewController.h"
#import "Utility.h"

@interface SecondViewController ()
{
    BOOL isPortrait_;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

//8.0 <= ios version < 8.3, 部分区域点击不了
- (IBAction)method:(id)sender {
    UIInterfaceOrientation orientation = UIInterfaceOrientationPortrait;
    CGAffineTransform trans = CGAffineTransformIdentity;
    CGFloat duration = [[UIApplication sharedApplication] statusBarOrientationAnimationDuration];
    
    if (!isPortrait_) {
        orientation = UIInterfaceOrientationPortrait;
        if ([Utility isEqualOrGreaterThanIOS8]) {  //ios 8 window的 self.view.superview frame = (0 0; 568 320)
            if (self.isMethod4) {
                trans = CGAffineTransformIdentity;
            }
            else {
                trans = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI_2);
            }
        }
        else {
            trans = CGAffineTransformIdentity;
        }
    }
    else {
        orientation = UIInterfaceOrientationLandscapeRight;
        if ([Utility isEqualOrGreaterThanIOS8]) {
            if (self.isMethod4) {
                trans = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
            }
            else {
                trans = CGAffineTransformIdentity;
            }
        }
        else {
            trans = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
        }
    }
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = trans;
        [[UIApplication sharedApplication] setStatusBarOrientation:orientation animated:YES];
    } completion:^(BOOL finished) {
        self.view.frame = self.view.superview.bounds;
        
        isPortrait_ = !isPortrait_;
    }];
}

- (IBAction)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)dismiss:(id)sender {
    if (self.isMethod4) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait
                                                          animated:NO];
    }
    else {
        //如果是UIInterfaceOrientationPortrait，[8.0，8.3)有影响
        [[UIApplication sharedApplication] setStatusBarOrientation:[self preferredInterfaceOrientationForPresentation]
                                                          animated:NO];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }

    if (APP_DELEGATE.secWindow) {
        APP_DELEGATE.secWindow = nil;
        [APP_DELEGATE.window makeKeyAndVisible];
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}


@end
