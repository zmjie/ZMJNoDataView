//
//  ZMJMacro.h
//  ZMJNoDataView
//
//  Created by zmjie on 2019/12/23.
//

#ifndef ZMJMacro_h
#define ZMJMacro_h

// 屏幕宽度
#define zmj_screenWidth (int)MIN([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)

// 屏幕高度
#define zmj_screenHeight (int)MAX([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)

// 状态栏高度
#define zmj_statusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

// 导航栏高度
#define zmj_navBarHeight (44 + zmj_statusBarHeight)

// RGB颜色值
#define zmj_color(r, g, b) zmj_colora(r, g, b, 1.0)

#define zmj_colora(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

// 获取图片
#define zmj_imageNamed(name) [UIImage imageNamed:(name)]

// 距离比例
#define zmj_size(R) (zmj_ratio * R)

// 屏幕宽比例
#define zmj_ratio (zmj_screenWidth / 375.0)

// 默认字体大小
#define zmj_defaultFontSize    14.0
#define zmj_fontSize(R) [UIFont systemFontOfSize:(zmj_ratio * R)]

// 字体
#define zmj_pingFangSCRegularSize(R) [UIFont fontWithName:(@"PingFangSC-Regular") size:(zmj_ratio * R)] ? : zmj_fontSize(R)

#endif /* ZMJMacro_h */
