//
//  ZMJNoDataView+ZMJ.m
//  ZMJNoDataView
//
//  Created by zmjie on 2019/12/23.
//

#import "ZMJNoDataView+ZMJ.h"

#import "ZMJNoDataView_Macro.h"

#import <objc/runtime.h>

static char *zmj_clickHandler;

@implementation ZMJNoDataView (ZMJ)

- (void)setZmj_ndvActionBlock:(ZMJNDVActionBlock)zmj_ndvActionBlock {

    objc_setAssociatedObject(self, &zmj_clickHandler, zmj_ndvActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ZMJNDVActionBlock)zmj_ndvActionBlock {

    return objc_getAssociatedObject(self, &zmj_clickHandler);
}

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler {
    
    ZMJNoDataView *zmj_ndv = [ZMJNoDataView zmj_showNDVAddedTo:view zmj_style:style zmj_message:message zmj_btnText:@"" zmj_delegate:nil];
    
    zmj_ndv.zmj_ndvImageView.image = zmj_imageNamed(image);
    zmj_ndv.zmj_ndvLabel.text = message;
    
    zmj_ndv.zmj_ndvActionBlock = [clickHandler copy];
    
    return zmj_ndv;
}


+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler {
    
    ZMJNoDataView *zmj_ndv = [ZMJNoDataView zmj_showNDVAddedTo:view zmj_frame:frame zmj_style:style zmj_message:message zmj_btnText:@"" zmj_delegate:nil];
    
    zmj_ndv.zmj_ndvImageView.image = zmj_imageNamed(image);
    zmj_ndv.zmj_ndvLabel.text = message;
    
    zmj_ndv.zmj_ndvActionBlock = [clickHandler copy];
    
    return zmj_ndv;
}

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_btnText:(NSString *)btnText zmj_toView:(UIView *)view zmj_clickHandler:(ZMJNDVActionBlock)clickHandler {
    
    ZMJNoDataView *zmj_ndv = [ZMJNoDataView zmj_showNDVAddedTo:view zmj_style:style zmj_message:message zmj_btnText:btnText zmj_delegate:nil];
    
    zmj_ndv.zmj_ndvImageView.image = zmj_imageNamed(image);
    zmj_ndv.zmj_ndvLabel.text = message;
    
    [zmj_ndv.zmj_ndvBtn setTitle:btnText forState:UIControlStateNormal];
    
    zmj_ndv.zmj_ndvActionBlock = [clickHandler copy];
    
    return zmj_ndv;
}

+ (ZMJNoDataView *)zmj_showNDVAndStyle:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_image:(NSString *)image zmj_btnText:(NSString *)btnText zmj_toView:(UIView *)view zmj_frame:(CGRect)frame zmj_clickHandler:(ZMJNDVActionBlock)clickHandler {
    
    ZMJNoDataView *zmj_ndv = [ZMJNoDataView zmj_showNDVAddedTo:view zmj_frame:frame zmj_style:style zmj_message:message zmj_btnText:btnText zmj_delegate:nil];
    
    zmj_ndv.zmj_ndvImageView.image = zmj_imageNamed(image);
    zmj_ndv.zmj_ndvLabel.text = message;
    
    [zmj_ndv.zmj_ndvBtn setTitle:btnText forState:UIControlStateNormal];
    
    zmj_ndv.zmj_ndvActionBlock = [clickHandler copy];
    
    return zmj_ndv;
}

+ (void)zmj_hideNDVForView:(UIView *)view {
    
    [self zmj_hideNDVForToView:view];
}

- (void)zmj_tapActionBlock:(UITapGestureRecognizer *)tap {
    
    if (self.zmj_ndvActionBlock) {

        self.zmj_ndvActionBlock();
    }
}

- (void)zmj_btnActionBlock:(UIButton *)btn {

    if (self.zmj_ndvActionBlock) {

        self.zmj_ndvActionBlock();
    }
}

@end
