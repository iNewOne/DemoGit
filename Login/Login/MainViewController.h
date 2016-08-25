
/*!
 @Header  MainViewController.h
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController

- (void)addChildVC:(UIViewController *)childVC
             title:(NSString *)title
             image:(NSString *)imageName
     selectedImage:(NSString *)selectedImageName;

@end
