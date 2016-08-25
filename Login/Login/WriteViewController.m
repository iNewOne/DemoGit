
/*!
 @Header  WriteViewController.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/25.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "WriteViewController.h"

@interface WriteViewController ()<UITextViewDelegate>{
    
    UIButton * send;
    
    UITextView * weiboTV;
    
}

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 200, 44)];
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    label1.text = @"发微博";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:17];
    [titleView addSubview:label1];
    
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 24, 200, 15)];
    label2.text = @"简单飞先生";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor lightGrayColor];
    label2.font = [UIFont systemFontOfSize:14];
    [titleView addSubview:label2];
    
    self.navigationItem.titleView = titleView;
    
//    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton * cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:cancel];
    self.navigationItem.leftBarButtonItem = item1;
    
    
    send = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 23)];
    [send setBackgroundColor:[UIColor whiteColor]];
    send.layer.borderColor = [UIColor lightGrayColor].CGColor;
    send.layer.borderWidth = 0.5;
    send.layer.cornerRadius = 2;
    send.titleLabel.font = [UIFont systemFontOfSize:14];
    send.userInteractionEnabled = NO;
    [send setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    
    [send addTarget:self action:@selector(sendWeibo) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:send];
    self.navigationItem.rightBarButtonItem = item2;
    
    
    weiboTV = [[UITextView alloc]initWithFrame:CGRectMake(10, 5, ScreenWidth - 20, ScreenHeight)];
    weiboTV.delegate = self;
    weiboTV.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:weiboTV];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length > 0) {
        send.backgroundColor = [UIColor orangeColor];
        [send setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        send.userInteractionEnabled = YES;
        send.layer.borderWidth = 0;
    }else{
        send.backgroundColor = [UIColor whiteColor];
        [send setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        send.userInteractionEnabled = NO;
        send.layer.borderWidth = 0.5;
    }

}




- (void)sendWeibo{
    
}


- (void)cancelAction:(UIButton *)button{
    [weiboTV resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
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
