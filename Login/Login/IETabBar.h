
/*!
 @Header  IETabBar.h
 
 @ProjectName  Login
 
 @Author  Created by NSObject on 16/8/23.
 
  Copyright © 2016年 NSObject. All rights reserved.
 */

#import <UIKit/UIKit.h>

@class IETabBar;

@protocol IETabBarDelegate <NSObject>

- (void)tabBarDidClickPlusButton:(IETabBar *)tabBar;

- (void)tabBarDidLongPressPlusButton:(IETabBar *)tabBar;

@end

@interface IETabBar : UITabBar

@property (nonatomic, weak) id <IETabBarDelegate> ieDelegate;

@end
