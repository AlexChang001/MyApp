
//
//  BaseNavigationController.m
//  MyApp
//
//  Created by yfzx-sh-zhangyu on 16/5/13.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () <UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
    
    [self.interactivePopGestureRecognizer setEnabled:NO];
    [self.interactivePopGestureRecognizer setDelegate:nil];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc]init]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *naviRoot = [self.viewControllers firstObject];
    if (naviRoot && [viewController isEqual:naviRoot]) {
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:YES];
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *navRoot = [self.viewControllers firstObject];
    if (navRoot && [viewController isEqual:navRoot]) {
        [viewController.navigationController.interactivePopGestureRecognizer setEnabled:YES];
        [viewController.navigationController.interactivePopGestureRecognizer setDelegate:nil];
        viewController.tabBarController.tabBar.hidden = NO;
    }else{
        [viewController.navigationController.interactivePopGestureRecognizer setEnabled: NO];
        [viewController.navigationController.interactivePopGestureRecognizer setDelegate:nil];
    }
}



@end
