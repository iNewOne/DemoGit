//
//  UINavigationBar+Extension.m
//  Login
//
//  Created by NSObject on 16/8/25.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "UINavigationBar+Extension.h"

@implementation UINavigationBar (Extension)

- (UIImage *)barBackground
{
    UIImage * image = [UIImage imageNamed:@"navigationbar_background"];
    CGFloat top = 25; // 顶端盖高度
    CGFloat bottom = 25 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 10; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 伸缩后重新赋值
    UIImage * newImage = [image resizableImageWithCapInsets:insets];
    return newImage;
}

- (void)didMoveToSuperview
{
    //iOS5 only
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
//        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
    }
}

//this doesn't work on iOS5 but is needed for iOS4 and earlier
- (void)drawRect:(CGRect)rect
{
    //draw image
    [[self barBackground] drawInRect:rect];
}


@end
