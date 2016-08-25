
/*!
 @Header  CenterViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/24.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "CenterViewController.h"

@interface CenterViewController (){
    UIButton * button;
}

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:self.screenImage];
//    [self.view addSubview:imageView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    
    button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 18, 4, 36, 36)];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    
    

    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeRotation(M_PI / 4);//旋转180度
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    

    
}


- (void)buttonClick{
    
    [UIView setAnimationDuration:2];
    
    [UIView animateWithDuration:2 animations:^{
        button.transform = CGAffineTransformMakeRotation(- M_PI / 4);//旋转180度
        [button removeFromSuperview];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];

    }];
    

    
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
