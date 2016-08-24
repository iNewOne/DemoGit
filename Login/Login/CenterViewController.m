
/*!
 @Header  CenterViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/24.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView * imageView = [[UIImageView alloc]initWithImage:self.screenImage];
//    [self.view addSubview:imageView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = 0.3;
    
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    backView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backView];
    
    
    
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
