//
//  ZMJNoDataView.m
//  ZMJNoDataView_Example
//
//  Created by zmjie on 2019/12/23.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import "ZMJNoDataView.h"

#import "ZMJNoDataView_Macro.h"

#import "UIColor+ZMJNoDataView.h"
#import "UIView+ZMJNoDataView.h"
#import "UIViewController+ZMJNoDataView.h"

#import <Masonry/Masonry.h>

@interface ZMJNoDataView ()

@property (strong, nonatomic) UIView *zmj_contentView;
@property (strong, nonatomic) UIImageView *zmj_ndvImageView;
@property (strong, nonatomic) UILabel *zmj_ndvLabel;
@property (strong, nonatomic) UIButton *zmj_ndvBtn;

@property (assign, nonatomic) ZMJNoDataViewStyle zmj_style;
@property (copy, nonatomic) NSString *zmj_message;
@property (copy, nonatomic) NSString *zmj_btnText;

@end

@implementation ZMJNoDataView

- (instancetype)initWithFrame:(CGRect)frame zmj_style:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_btnText:(NSString *)btnText zmj_delegate:(nullable id<zmj_ndvDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
        
        self.alpha = 0.0f;
        self.frame = frame;
        
        _zmj_style = style;
        _zmj_message = message;
        _zmj_btnText = btnText;
        _zmj_delegate = delegate;
        
        [self zmj_initData];
        [self zmj_initView];
        [self zmj_makeSubViewsConstraints];
        
        switch (_zmj_style) {
                
            case ZMJNoDataViewStyleNone:break;
            case ZMJNoDataViewStyleBtn:break;
                
            case ZMJNoDataViewStyleGesture: {
                
                [self zmj_initGesture];
            }
                break;
                
            default:
                break;
        }
    }
    return self;
}

+ (instancetype)zmj_showNDVAddedTo:(UIView *)view zmj_style:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_btnText:(NSString *)btnText zmj_delegate:(nullable id<zmj_ndvDelegate>)delegate {
    
    if (view) {}
    else {
        
        view = [UIViewController zmj_topViewController].view;
    }
    
    return [self zmj_showNDVAddedTo:view zmj_frame:view.bounds zmj_style:style zmj_message:message zmj_btnText:btnText zmj_delegate:delegate];
}

+ (instancetype)zmj_showNDVAddedTo:(UIView *)view zmj_frame:(CGRect)frame zmj_style:(ZMJNoDataViewStyle)style zmj_message:(NSString *)message zmj_btnText:(NSString *)btnText zmj_delegate:(nullable id<zmj_ndvDelegate>)delegate {
    
    ZMJNoDataView *zmj_ndv = [[self alloc] initWithFrame:frame zmj_style:style zmj_message:message zmj_btnText:btnText zmj_delegate:delegate];
    [view addSubview:zmj_ndv];
    
    [UIView animateWithDuration:0.25f animations:^{
        
        zmj_ndv.alpha = 1.0f;
        
    }completion:^(BOOL finished) {
    }];
    
    return zmj_ndv;
}

+ (BOOL)zmj_hideNDVForToView:(UIView *)view {
    
    ZMJNoDataView *zmj_ndv = [self zmj_ndvForView:view];
    
    if (zmj_ndv) {
        
        [UIView animateWithDuration:0.25f animations:^{
            
            zmj_ndv.alpha = 0.0f;
            
        }completion:^(BOOL finished) {
            
            [zmj_ndv removeFromSuperview];
        }];
        return YES;
    }
    return NO;
}

+ (ZMJNoDataView *)zmj_ndvForView:(UIView *)view {
    
    NSEnumerator *zmj_enumerator = [view.subviews reverseObjectEnumerator];
    
    for (UIView *zmj_view in zmj_enumerator) {
        
        if ([zmj_view isKindOfClass:self]) {
            
            return (ZMJNoDataView *)zmj_view;
        }
    }
    return nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.zmj_width == 0) {
        return;
    }
    
    if (_zmj_ndvBtn.zmj_height > 0) {
        
        _zmj_ndvBtn.layer.cornerRadius = _zmj_cornerRadius > _zmj_ndvBtn.zmj_height ? _zmj_ndvBtn.zmj_height / 2 : _zmj_cornerRadius;
    }
}

- (void)setZmj_cornerRadius:(CGFloat)zmj_cornerRadius {
    
    _zmj_cornerRadius = zmj_cornerRadius;
    
    [self layoutIfNeeded];
}

- (void)zmj_initView {
    
    [self addSubview:self.zmj_contentView];
    [self addSubview:self.zmj_ndvImageView];
    [self addSubview:self.zmj_ndvLabel];
    [self addSubview:self.zmj_ndvBtn];
    
    switch (_zmj_style) {
            
        case ZMJNoDataViewStyleNone:
        case ZMJNoDataViewStyleGesture: {
            
            _zmj_ndvBtn.hidden = YES;
        }
            break;
        
        case ZMJNoDataViewStyleBtn: {
            
            _zmj_ndvBtn.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}

- (void)zmj_initData {
    
    _zmj_cornerRadius = 5.0f;
}

- (void)zmj_makeSubViewsConstraints {
    
    [_zmj_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-zmj_size(10));
        make.leading.trailing.equalTo(self);
    }];

    [_zmj_ndvImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.zmj_contentView);
    }];
    
    CGFloat zmj_y = zmj_size(15);
    
    if ([_zmj_message stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        
        zmj_y = 0;
    }
    
    [_zmj_ndvLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zmj_ndvImageView.mas_bottom).offset(zmj_y);
        make.leading.trailing.equalTo(self.zmj_ndvImageView);
    }];
    
    switch (_zmj_style) {
            
        case ZMJNoDataViewStyleNone:
        case ZMJNoDataViewStyleGesture: {
            
            [_zmj_ndvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.zmj_ndvLabel.mas_bottom);
                make.centerX.equalTo(self.mas_centerX);
                make.bottom.equalTo(self.zmj_contentView);
                make.width.mas_equalTo(zmj_screenWidth / 2);
                make.height.mas_equalTo(0);
            }];
        }
            break;
            
        case ZMJNoDataViewStyleBtn: {
            
            zmj_y = zmj_size(25);
            
            CGFloat zmj_height = zmj_size(40);
            
            if ([_zmj_btnText stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
                
                zmj_y = 0;
                zmj_height = 0;
            }
            
            [_zmj_ndvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.zmj_ndvLabel.mas_bottom).offset(zmj_y);
                make.centerX.equalTo(self.mas_centerX);
                make.bottom.equalTo(self.zmj_contentView);
                make.width.mas_equalTo(zmj_screenWidth / 2.5);
                make.height.mas_equalTo(zmj_height);
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)zmj_initGesture {
    
    UITapGestureRecognizer *zmj_tap = [[UITapGestureRecognizer alloc] init];
    [zmj_tap addTarget:self action:@selector(zmj_tap:)];
    [self addGestureRecognizer:zmj_tap];
}

- (UIView *)zmj_contentView {
    if (!_zmj_contentView) {
        _zmj_contentView = [[UIView alloc] init];
    }
    return _zmj_contentView;
}

- (UIImageView *)zmj_ndvImageView {
    if (!_zmj_ndvImageView) {
        _zmj_ndvImageView = [[UIImageView alloc] init];
        _zmj_ndvImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _zmj_ndvImageView;
}

- (UILabel *)zmj_ndvLabel{
    if (!_zmj_ndvLabel) {
        _zmj_ndvLabel = [[UILabel alloc] init];
        _zmj_ndvLabel.textColor = [UIColor zmj_dynamicColor:zmj_color(51, 51, 51) zmj_darkColor:zmj_color(51, 51, 51)];
        _zmj_ndvLabel.font = zmj_pingFangSCRegularSize((zmj_defaultFontSize + 2));
        _zmj_ndvLabel.textAlignment = NSTextAlignmentCenter;
        _zmj_ndvLabel.numberOfLines = 0;
    }
    return _zmj_ndvLabel;
}

- (UIButton *)zmj_ndvBtn {
    if (!_zmj_ndvBtn) {
        _zmj_ndvBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zmj_ndvBtn setTitleColor:[UIColor zmj_dynamicColor:zmj_color(51, 51, 51) zmj_darkColor:zmj_color(51, 51, 51)] forState:UIControlStateNormal];
        _zmj_ndvBtn.titleLabel.font = zmj_pingFangSCRegularSize((zmj_defaultFontSize + 2));
        [_zmj_ndvBtn addTarget:self action:@selector(zmj_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zmj_ndvBtn;
}

- (void)zmj_btnAction:(UIButton *)btn {
    
    if ([self.zmj_delegate respondsToSelector:@selector(zmj_ndvBtnAction:)]) {
        
        [self.zmj_delegate zmj_ndvBtnAction:btn];
        return;
    }
    
    [self zmj_btnActionBlock:btn];
}

- (void)zmj_tap:(UITapGestureRecognizer *)tap {
    
    if ([self.zmj_delegate respondsToSelector:@selector(zmj_ndvTapAction:)]) {

        [self.zmj_delegate zmj_ndvTapAction:tap];
        return;
    }

    [self zmj_tapActionBlock:tap];
}

- (void)zmj_tapActionBlock:(UITapGestureRecognizer *)tap {}
- (void)zmj_btnActionBlock:(UIButton *)btn {}

@end
