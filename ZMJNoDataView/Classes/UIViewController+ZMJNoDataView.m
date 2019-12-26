//
//  UIViewController+ZMJNoDataView.m
//  ZMJNoDataView
//
//  Created by zmjie on 2019/12/26.
//

#import "UIViewController+ZMJNoDataView.h"

@implementation UIViewController (ZMJNoDataView)

+ (UIViewController *)zmj_topViewController {
    
    return [self zmj_topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)zmj_topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *zmj_tabBarController = (UITabBarController *)rootViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_tabBarController.selectedViewController];
        
    }else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *zmj_navigationController = (UINavigationController *)rootViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_navigationController.visibleViewController];
        
    }else if (rootViewController.presentedViewController) {
        
        UIViewController *zmj_presentedViewController = rootViewController.presentedViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_presentedViewController];
        
    }else {
        
        return rootViewController;
    }
}

@end
