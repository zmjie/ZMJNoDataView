//
//  ZMJNoDataView.h
//  ZMJNoDataView_Example
//
//  Created by zmjie on 2019/12/23.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZMJNoDataViewStyle) {
    ZMJNoDataViewStyleNone,
    ZMJNoDataViewStyleBtn,
    ZMJNoDataViewStyleGesture
};

@protocol zmj_ndvDelegate <NSObject>

- (void)zmj_ndvTapAction:(UITapGestureRecognizer *)tap;

- (void)zmj_ndvBtnAction:(UIButton *)btn;

@end

@interface ZMJNoDataView : UIView

@property (weak, nonatomic) id<zmj_ndvDelegate>zmj_delegate;

@property (strong, nonatomic, readonly) UIImageView *zmj_ndvImageView;
@property (strong, nonatomic, readonly) UILabel *zmj_ndvLabel;
@property (strong, nonatomic, readonly) UIButton *zmj_ndvBtn;

+ (instancetype)zmj_showNDVAddedTo:(UIView *)view zmj_style:(ZMJNoDataViewStyle)style zmj_delegate:(nullable id<zmj_ndvDelegate>)delegate;

+ (instancetype)zmj_showNDVAddedTo:(UIView *)view zmj_frame:(CGRect)frame zmj_style:(ZMJNoDataViewStyle)style zmj_delegate:(nullable id<zmj_ndvDelegate>)delegate;

+ (BOOL)zmj_hideNDVForToView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
