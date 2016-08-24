
/*!
 @Header  IETabBar.m
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import "IETabBar.h"

@interface IETabBar()<UITabBarDelegate>

@property (nonatomic, weak) UIButton * publishButton;

@end

@implementation IETabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        [publishButton addTarget:self action:@selector(publishBtnclick) forControlEvents:UIControlEventTouchUpInside];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)publishBtnclick{
    if (self.ieDelegate && [self.ieDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.ieDelegate tabBarDidClickPlusButton:self];
    }else{
        NSLog(@"error");
        
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置发布按钮的frame
    self.publishButton.bounds = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        //        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
