
/*!
 @Header  MainViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MyViewController.h"
#import "AppDelegate.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"macOS-Sierra-iPhone"];
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:1.5 animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(imageView.transform, 1.2, 1.2);
        imageView.alpha = 0;
        imageView.transform = newTransform;
        
    } completion:^(BOOL finished) {
        
        HomeViewController * vc1 = [[HomeViewController alloc]init];
        UINavigationController * na1 = [[UINavigationController alloc]initWithRootViewController:vc1];
        vc1.tabBarItem.title = @"首页";
        vc1.tabBarItem.image = [UIImage imageNamed:@"首页"];
        
        MessageViewController * vc2 = [[MessageViewController alloc]init];
        UINavigationController * na2 = [[UINavigationController alloc]initWithRootViewController:vc2];
        vc2.tabBarItem.title = @"消息";
        vc2.tabBarItem.image = [UIImage imageNamed:@"消息"];
        
        DiscoverViewController * vc3 = [[DiscoverViewController alloc]init];
        UINavigationController * na3 = [[UINavigationController alloc]initWithRootViewController:vc3];
        vc3.tabBarItem.title = @"发现";
        vc3.tabBarItem.image = [UIImage imageNamed:@"发现"];
        
        MyViewController * vc4 = [[MyViewController alloc]init];
        UINavigationController * na4 = [[UINavigationController alloc]initWithRootViewController:vc4];
        vc4.tabBarItem.title = @"我的";
        vc4.tabBarItem.image = [UIImage imageNamed:@"我的"];
        
        UITabBarController * vc = [[UITabBarController alloc]init];
        vc.viewControllers = @[na1, na2, na3, na4];
//        vc.tabBar.backgroundColor = [UIColor orangeColor];
        vc.tabBar.translucent = YES;
        
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        app.window.rootViewController = vc;
        
    }];
    
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
