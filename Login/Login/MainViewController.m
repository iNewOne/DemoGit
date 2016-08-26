
/*!
 @Header  MainViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "MainViewController.h"
#import "IENavigationViewController.h"
#import "IETabBar.h"
#import "WriteViewController.h"
#import "UIView+Screen.h"
#import "UIImage+BlurGlass.h"

#define IEWeakSelf(type) __block typeof(type) weak##type = type;

@interface MainViewController ()<IETabBarDelegate>{
    
    /**
     *  点击中间按钮的弹出View
     */
    UIImageView * maskView;
    
    UIButton * button;
    
    UIView * backView;
    
    
    UIView * springView;
    
    
    
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"macOS-Sierra-iPhone"];
    [self.view addSubview:imageView];
    
//    IEWeakSelf(self);
    
    
    IETabBar *tabBar = [[IETabBar alloc] init];
    // 设置代理
    tabBar.ieDelegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    // 修改tabBar为自定义tabBar
    [self setValue:tabBar forKey:@"tabBar"];
    
    [UIView animateWithDuration:1.5 animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(imageView.transform, 1.2, 1.2);
        imageView.alpha = 0;
        imageView.transform = newTransform;
        
    } completion:^(BOOL finished) {
        
        [imageView removeFromSuperview];
        
    }];
    
    
    maskView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    backView = [[UIView alloc]initWithFrame:self.tabBar.frame];
    backView.backgroundColor = [UIColor whiteColor];
    [maskView addSubview:backView];
    
    
    button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 18, 4, 36, 36)];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    
    
    
    springView = [[UIView alloc]initWithFrame:CGRectMake(20, ScreenHeight + 200, 100, 100)];
    springView.backgroundColor = [UIColor redColor];
    UIImage * image = [UIImage imageNamed:@"tabbar_compose_camera"];
    [maskView addSubview:springView];
    
    UIImageView * demoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    demoView.image = image;
    [springView addSubview:demoView];
    
    
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
//    DBLog(@"点击button");
    
    [self updateBlur];
    
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        springView.origin = CGPointMake(20, 200);
        maskView.alpha = 1;
        button.transform = CGAffineTransformRotate(button.transform, M_PI / 4);
    } completion:^(BOOL finished) {
        
    }];
    
    
    
//    CenterViewController * vc = [[CenterViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self presentViewController:vc animated:NO completion:nil];
    
    
}


- (void)updateBlur{
    
    [self.view.superview addSubview:maskView];
    
    UIImage * shotImage = [self.view convertViewToImage];
    
    UIImage * newImage = [shotImage imgWithBlur];

    maskView.image = newImage;
    maskView.userInteractionEnabled = YES;
    

}

- (void)buttonClick{
    
//    [UIView setAnimationDuration:0.2];

    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        springView.origin = CGPointMake(20, ScreenHeight + 200);
        button.transform=CGAffineTransformRotate(button.transform, - M_PI / 4);

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            maskView.alpha = 0;
            [maskView removeFromSuperview];

        }];

    }];
    
    
}


- (void)tabBarDidLongPressPlusButton:(IETabBar *)tabBar{
//    DBLog(@"长按button");
    
    WriteViewController * vc = [[WriteViewController alloc]init];

    IENavigationViewController * na = [[IENavigationViewController alloc]initWithRootViewController:vc];
    na.hidesBottomBarWhenPushed = YES;
    [self presentViewController:na animated:YES completion:nil];
    
    
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
