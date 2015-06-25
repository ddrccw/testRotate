//
//  ViewController.m
//  testRotate
//
//  Created by NetEase on 15-5-15.
//  Copyright (c) 2015年 ddrccw. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Utility.h"

@interface ViewController (){
    BOOL shouldAutorotate_;
}

@property (strong, nonatomic) SecondViewController *secvc; //for method4, otherwise it will crash

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  method1 ~ method3，8.0 <= ios version < 8.3, 部分区域点击不了
 */
- (IBAction)method1:(id)sender {
    //shouldAutorotate_ 不影响
    [self presentViewController:[SecondViewController new] animated:YES completion:nil];
}

- (IBAction)method2:(id)sender {
    shouldAutorotate_ = NO;  //有影响
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    APP_DELEGATE.secWindow = [[UIWindow alloc] initWithFrame:frame];
    
    ViewController *vc = [ViewController new];
    
    SecondViewController *svc = [SecondViewController new];
    [APP_DELEGATE.secWindow setRootViewController:vc];
    [APP_DELEGATE.secWindow makeKeyAndVisible];
    
    [vc presentViewController:svc animated:YES completion:nil];
}

- (IBAction)method3:(id)sender {
    //shouldAutorotate_ 不影响
    SecondViewController *svc = [SecondViewController new];
    [APP_DELEGATE.window.rootViewController presentViewController:svc animated:YES completion:nil];
}

- (IBAction)method4:(id)sender {
    shouldAutorotate_ = NO;  //有影响
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    APP_DELEGATE.secWindow = [[UIWindow alloc] initWithFrame:frame];
    self.secvc = [SecondViewController new];
    self.secvc.isMethod4 = YES;
    [APP_DELEGATE.secWindow addSubview:self.secvc.view];
    [APP_DELEGATE.secWindow makeKeyAndVisible];
    
    UIInterfaceOrientation orientation = self.secvc.preferredInterfaceOrientationForPresentation;
    CGAffineTransform trans = CGAffineTransformIdentity;
    if (orientation == UIInterfaceOrientationLandscapeRight) {
        orientation = UIInterfaceOrientationLandscapeRight;
        trans = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
    }
    self.secvc.view.transform = trans;
    self.secvc.view.frame = frame;
    [[UIApplication sharedApplication] setStatusBarOrientation:orientation animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (BOOL)shouldAutorotate {
    return shouldAutorotate_;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
