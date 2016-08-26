//
//  ViewController.m
//  demo
//
//  Created by NSObject on 16/8/26.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ViewController.h"
#import "SeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)jump{
    SeViewController * vc = [[SeViewController alloc]init];
    UINavigationController * na = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:na animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
