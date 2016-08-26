
/*!
 @Header  IENavigationViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "IENavigationViewController.h"

@interface IENavigationViewController ()

@end

@implementation IENavigationViewController

+ (void)initialize{
    
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
    
    
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    UIViewController * vc = self.topViewController;
//    return vc.preferredStatusBarStyle;
//}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        // 自动隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 定义leftBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTargat:self action:@selector(back) image:@"hotweibo_back_icon_highlighted" highImage:@"hotweibo_back_icon_highlighted"];
        
        // 定义rightBarButtonItem
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTargat:self action:@selector(more) image:@"music_more_highlighted@2x" highImage:@"music_more_highlighted@2x"];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

- (void)more{
    [self popToRootViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
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
