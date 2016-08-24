
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

#import "CenterViewController.h"

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
        
        [self addChildVC:[[HomeViewController alloc]init] title:@"首页" image:@"首页未选中" selectedImage:@"首页选中"];
        [self addChildVC:[[MessageViewController alloc]init] title:@"消息" image:@"消息未选中" selectedImage:@"消息选中"];
        [self addChildVC:[[DiscoverViewController alloc]init] title:@"搜索" image:@"搜索未选中" selectedImage:@"搜索选中"];
        [self addChildVC:[[MyViewController alloc]init] title:@"我的" image:@"我的未选中" selectedImage:@"我的选中"];
        
        
        
        IETabBar *tabBar = [[IETabBar alloc] init];
        // 设置代理
        tabBar.ieDelegate = self;
        // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
        // 修改tabBar为自定义tabBar
        [self setValue:tabBar forKey:@"tabBar"];

    }];
    
}

- (void)addChildVC:(UIViewController *)childVC
             title:(NSString *)title
             image:(NSString *)imageName
     selectedImage:(NSString *)selectedImageName{
    
    childVC.title = title;
    
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    
    IENavigationViewController * nav = [[IENavigationViewController alloc]initWithRootViewController:childVC];
    
    
    [self addChildViewController:nav];
    
}




- (void)tabBarDidClickPlusButton:(IETabBar *)tabBar{
    NSLog(@"YES");
    
    CenterViewController * vc = [[CenterViewController alloc]init];
//    vc.screenImage = [self screenShot];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}


- (UIImage *)screenShot{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), YES, 3);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
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
