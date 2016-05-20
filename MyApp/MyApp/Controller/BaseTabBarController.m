
//
//  BaseTabBarController.m
//  MyApp
//
//  Created by yfzx-sh-zhangyu on 16/5/12.
//  Copyright © 2016年 Alex. All rights reserved.
//  利用系统的UITabBarController的代理来自定义自己的BaseTabBarController

#import "BaseTabBarController.h"
#import "LobbyIndexController.h"
#import "ActivityIndexController.h"
#import "WealthIndexController.h"
#import "AccountIndexController.h"
#import "BaseNavigationController.h"

@interface BaseTabBarController () <UITabBarControllerDelegate>

@property (nonatomic,strong)NSMutableArray *imgArray;
@property (nonatomic,strong)NSMutableArray *selectedImgArray;

@end
@implementation BaseTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _imgArray = [[NSMutableArray alloc]init];
    _selectedImgArray = [[NSMutableArray alloc]init];
    self.delegate = self;
    [self setSubControllers];
}

#pragma mark - subViewControllers

- (void)setSubControllers{
    LobbyIndexController *vc0 = [[LobbyIndexController alloc]init];
    ActivityIndexController *vc1 = [[ActivityIndexController alloc]init];
    WealthIndexController *vc2 = [[WealthIndexController alloc]init];
    AccountIndexController *vc3 = [[AccountIndexController alloc]init];
    
    NSArray *vcArray = [NSArray arrayWithObjects:
                        [self naviWithRoot:vc0 Title:@"应用" Img:@"lobby_normal" selectedImg:@"lobby_pressed"],
                        [self naviWithRoot:vc1 Title:@"活动" Img:@"service_normal" selectedImg:@"service_pressed"],
                        [self naviWithRoot:vc2 Title:@"财富" Img:@"finance_normal" selectedImg:@"finance_pressed"],
                        [self naviWithRoot:vc3 Title:@"账户" Img:@"account_normal" selectedImg:@"account_pressed"],nil];
    [self setViewControllers:vcArray animated:YES];
    self.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:45/255.0 blue:85/255.0 alpha:1];
    
}

- (BaseNavigationController *)naviWithRoot:(UIViewController *)vc Title:(NSString *)title Img:(NSString *)img selectedImg:(NSString *)selectedImg{
    vc.title = title;
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:img] selectedImage:[UIImage imageNamed:selectedImg]];
    [_imgArray addObject:[UIImage imageNamed:img]];
    [_selectedImgArray addObject:[UIImage imageNamed:selectedImg]];
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    return nav;
}


@end
