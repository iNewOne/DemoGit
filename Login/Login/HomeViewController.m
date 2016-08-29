
/*!
 @Header  HomeViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "HomeViewController.h"
#import "ScanViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <AVFoundation/AVFoundation.h>
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor clearColor];
    UIButton * radia = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [radia setImage:[UIImage imageNamed:@"navigationbar_icon_radar"] forState:UIControlStateNormal];
    [radia addTarget:self action:@selector(radiaAction) forControlEvents:UIControlEventTouchUpInside];
    [radia setImage:[UIImage imageNamed:@"navigationbar_icon_radar_highlighted"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:radia];
    self.navigationItem.rightBarButtonItem = item;
    
    
    // Do any additional setup after loading the view.
}

- (void)radiaAction{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus == AVAuthorizationStatusRestricted|| authStatus == AVAuthorizationStatusDenied) {
        
        // 获取摄像头失败
        DBLog(@"失败");
        
    }else{
        DBLog(@"成功");
        // 获取摄像头成功
        ScanViewController * vc = [[ScanViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:NO];
        [self presentViewController:vc animated:NO completion:nil];
    }
    
    
    

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
