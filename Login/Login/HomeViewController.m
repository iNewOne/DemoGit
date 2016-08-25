
/*!
 @Header  HomeViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    
    UIButton * radia = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [radia setImage:[UIImage imageNamed:@"navigationbar_icon_radar"] forState:UIControlStateNormal];
    [radia addTarget:self action:@selector(radiaAction) forControlEvents:UIControlEventTouchUpInside];
    [radia setImage:[UIImage imageNamed:@"navigationbar_icon_radar_highlighted"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:radia];
    self.navigationItem.rightBarButtonItem = item;
    
    
    // Do any additional setup after loading the view.
}

- (void)radiaAction{
    
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
