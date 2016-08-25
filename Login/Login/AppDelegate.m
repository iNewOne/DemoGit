//
//  AppDelegate.m
//  Login
//
//  Created by NSObject on 16/8/23.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MyViewController.h"
#import "AppDelegate.h"
#import "IETabBar.h"
#import "IENavigationViewController.h"
#import "CenterViewController.h"
@interface AppDelegate ()<IETabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    DBLog(@"%@", NSHomeDirectory());
    
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainViewController * mainVC = [[MainViewController alloc]init];

    
    [mainVC addChildVC:[[HomeViewController alloc]init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    [mainVC addChildVC:[[MessageViewController alloc]init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [mainVC addChildVC:[[DiscoverViewController alloc]init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [mainVC addChildVC:[[MyViewController alloc]init] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];


    self.window.rootViewController = mainVC;
    
    UIColor * color = [UIColor grayColor];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    //大功告成
    [UINavigationBar appearance].titleTextAttributes = dict;
    [UINavigationBar appearance].translucent = NO;
    
    [self.window makeKeyAndVisible];
    
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
