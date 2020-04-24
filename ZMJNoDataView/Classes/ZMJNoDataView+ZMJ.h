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

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_btnText:(NSString *)btnText zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_btnText:(NSString *)btnText zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler;

+ (void)zmj_hideNDVForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
