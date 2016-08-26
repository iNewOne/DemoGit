//
//  UIView+Screen.m
//  Login
//
//  Created by NSObject on 16/8/26.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "UIView+Screen.h"

@implementation UIView (Screen)


- (UIImage *)convertViewToImage{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 3);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
