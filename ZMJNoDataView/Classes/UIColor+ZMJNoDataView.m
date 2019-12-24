//
//  UIColor+ZMJNoDataView.m
//  ZMJNoDataView
//
//  Created by qx on 2019/12/23.
//

#import "UIColor+ZMJNoDataView.h"

@implementation UIColor (ZMJNoDataView)

+ (UIColor *)zmj_dynamicColor:(UIColor *)lightColor zmj_darkColor:(UIColor *)darkColor {
    
    if (@available(iOS 13.0, *)) {
        
        UIColor *zmj_color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                
                return lightColor;
                
            }else {
                
                return darkColor;
            }
        }];
        
        return zmj_color;
        
    }else {
        
        return lightColor;
    }
}

@end
