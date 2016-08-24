
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
#import "IETabBar.h"
#import "IENavigationViewController.h"

#define IEWeakSelf(type) __weak typeof(type) weak##type = type;

@interface MainViewController ()<IETabBarDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"macOS-Sierra-iPhone"];
    [self.view addSubview:imageView];
    
//    IEWeakSelf(self);
    
    
    [UIView animateWithDuration:1.5 animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(imageView.transform, 1.2, 1.2);
        imageView.alpha = 0;
        imageView.transform = newTransform;
        
    } completion:^(BOOL finished) {
        
        HomeViewController * vc1 = [[HomeViewController alloc]init];
        vc1.tabBarItem.title = @"首页";
        vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"首页选中"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc1.tabBarItem.image = [[UIImage imageNamed:@"首页未选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        MessageViewController * vc2 = [[MessageViewController alloc]init];
        vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"消息选中"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc2.tabBarItem.title = @"消息";
        vc2.tabBarItem.image = [[UIImage imageNamed:@"消息未选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        DiscoverViewController * vc3 = [[DiscoverViewController alloc]init];
        vc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"搜索选中"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc3.tabBarItem.title = @"搜索";
        vc3.tabBarItem.image = [[UIImage imageNamed:@"搜索未选中"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        MyViewController * vc4 = [[MyViewController alloc]init];
        vc4.tabBarItem.title = @"我的";
        vc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"我的选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc4.tabBarItem.image = [[UIImage imageNamed:@"我的未选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
//        UITabBarController * vc = [[UITabBarController alloc]init];
//        vc.viewControllers = @[na1, na2, na3, na4];
//        vc.tabBar.backgroundColor = [UIColor orangeColor];
//        vc.tabBar.translucent = YES;
        
        
#pragma mark ------ 统一修改tabbar的选中，未选中文字状态
        /**
         *  UI_APPEARANCE_SELECTOR，都可以通过[UITabBarItem appearance]来设置
         */
        // 默认
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        
        // 选中
        NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
        attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrSelected[NSForegroundColorAttributeName] = [UIColor orangeColor];
        
        
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
        [item setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
        
        IETabBar *tabBar = [[IETabBar alloc] init];
        // 设置代理
        tabBar.ieDelegate = self;
        // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
        // 修改tabBar为自定义tabBar
//        [self setValue:tabBar forKey:@"tabBar"];
        
//        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//        app.window.rootViewController = vc;
        
        IENavigationViewController * nav1 = [[IENavigationViewController alloc]initWithRootViewController:vc1];
        IENavigationViewController * nav2 = [[IENavigationViewController alloc]initWithRootViewController:vc2];
        IENavigationViewController * nav3 = [[IENavigationViewController alloc]initWithRootViewController:vc3];
        IENavigationViewController * nav4 = [[IENavigationViewController alloc]initWithRootViewController:vc4];
        
        [self addChildViewController:nav1];
        [self addChildViewController:nav2];
        [self addChildViewController:nav3];
        [self addChildViewController:nav4];

        
        
        
    }];
    
    
    // Do any additional setup after loading the view.
}


- (void)tabBarDidClickPlusButton:(IETabBar *)tabBar{
    NSLog(@"YES");
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
