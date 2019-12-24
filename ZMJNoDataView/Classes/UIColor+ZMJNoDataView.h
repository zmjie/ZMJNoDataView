//
//  UIColor+ZMJNoDataView.h
//  ZMJNoDataView
//
//  Created by qx on 2019/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZMJNoDataView)

+ (UIColor *)zmj_dynamicColor:(UIColor *)lightColor zmj_darkColor:(UIColor *)darkColor;

@end

NS_ASSUME_NONNULL_END
