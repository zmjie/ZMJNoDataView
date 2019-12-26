//
//  ZMJNoDataView+ZMJ.h
//  ZMJNoDataView
//
//  Created by zmjie on 2019/12/23.
//

#import <ZMJNoDataView/ZMJNoDataView.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZMJNDVActionBlock)(void);

@interface ZMJNoDataView (ZMJ)

@property (copy, nonatomic) ZMJNDVActionBlock zmj_ndvActionBlock;

+ (ZMJNoDataView *)zmj_showNDVAndMessage:(NSString *)message zmj_image:(NSString *)image zmj_style:(ZMJNoDataViewStyle)style zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndMessage:(NSString *)message zmj_image:(NSString *)image zmj_style:(ZMJNoDataViewStyle)style zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndMessage:(NSString *)message zmj_image:(NSString *)image zmj_text:(NSString *)text zmj_textColor:(UIColor *)color zmj_style:(ZMJNoDataViewStyle)style zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndMessage:(NSString *)message zmj_text:(NSString *)text zmj_image:(NSString *)image zmj_textColor:(UIColor *)color zmj_style:(ZMJNoDataViewStyle)style zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (void)zmj_hideNDVForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
