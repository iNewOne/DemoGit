//
//  ViewController.m
//  文字渐变
//
//  Created by NSObject on 16/8/23.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CAGradientLayer * layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    label.text = @"一个人的时候，我想静一静";
    label.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:label];
    
    //创建透明层和label控件的大小一致
    layer = [CAGradientLayer layer];
    layer.frame = label.frame;
    //设定渐变层变化color的数组
    layer.colors = @[(id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
    //把渐变层加到整个view上面
    [self.view.layer addSublayer:layer];
    //最关键的一步，设置渐变图层的mask为label图层，就能用文字裁剪渐变图层了
    //根据透明度进行裁剪，只保留非透明部分，显示底部内容
    layer.mask = label.layer;
    label.frame = layer.bounds;
    //这个相比于NStimer的区别，大家自己去查
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textColorChange)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

// 定时器触发方法
-(void)textColorChange {
    layer.colors = @[(id)[self randomColor].CGColor,
                     (id)[self randomColor].CGColor,
                     (id)[self randomColor].CGColor,
                     (id)[self randomColor].CGColor,
                     (id)[self randomColor].CGColor];
}

-(UIColor*)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0
                           green:arc4random_uniform(255)/255.0
                            blue:arc4random_uniform(255)/255.6
                           alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
