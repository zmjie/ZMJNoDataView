//
//  ZMJDemoViewController.m
//  ZMJNoDataView_Example
//
//  Created by zmjie on 2019/12/23.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import "ZMJDemoViewController.h"

#import <ZMJNoDataView/ZMJNoDataView_Macro.h>

#import <Masonry/Masonry.h>
#import <ZMJNoDataView/ZMJNoDataView.h>
#import <ZMJNoDataView/ZMJNoDataView+ZMJ.h>
#import <ZMJNoDataView/UIColor+ZMJNoDataView.h>

@interface ZMJDemoViewController () <UITableViewDelegate, UITableViewDataSource, zmj_ndvDelegate>

@property (strong, nonatomic) UITableView *zmj_tableViewPlain;

@end

@implementation ZMJDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
    
    if (@available(iOS 11.0, *)) {} else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self zmj_initView];
    [self zmj_makeSubViewsConstraints];
    [self zmj_initRequest];
}

- (void)zmj_initView {

    [self.view addSubview:self.zmj_tableViewPlain];
}

- (void)zmj_makeSubViewsConstraints {
    
    [_zmj_tableViewPlain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(zmj_navBarHeight);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
}

- (void)zmj_initRequest {
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        ZMJNoDataView *zmj_ndv = [ZMJNoDataView zmj_showNDVAddedTo:self.zmj_tableViewPlain zmj_style:ZMJNoDataViewStyleGesture zmj_delegate:self];
//        zmj_ndv.zmj_ndvImageView.image = zmj_imageNamed(@"zmj_ndv_netError");
//        zmj_ndv.zmj_ndvLabel.text = @"无网络";
//        [zmj_ndv.zmj_ndvBtn setTitle:@"重新加载" forState:UIControlStateNormal];
//        [zmj_ndv.zmj_ndvBtn setTitleColor:[UIColor zmj_dynamicColor:zmj_color(51, 51, 51) zmj_darkColor:zmj_color(51, 51, 51)] forState:UIControlStateNormal];
//        [self.zmj_tableViewPlain addSubview:zmj_ndv];
//    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        switch (self.zmj_index) {

            case 0: {

                [ZMJNoDataView zmj_showNDVAndMessage:@"无网络" zmj_image:@"zmj_ndv_netError" zmj_text:@"重新加载" zmj_textColor:[UIColor zmj_dynamicColor:zmj_color(51, 51, 51) zmj_darkColor:zmj_color(51, 51, 51)] zmj_style:ZMJNoDataViewStyleBtn zmj_toView:self.zmj_tableViewPlain zmj_clickHandler:^{

                    [ZMJNoDataView zmj_hideNDVForView:self.zmj_tableViewPlain];

                    [self zmj_initRequest];
                }];
            }
                break;

            case 1: {

                [ZMJNoDataView zmj_showNDVAndMessage:@"暂无数据" zmj_image:@"zmj_ndv_noData" zmj_style:ZMJNoDataViewStyleGesture zmj_toView:self.zmj_tableViewPlain zmj_clickHandler:^{

                    [ZMJNoDataView zmj_hideNDVForView:self.zmj_tableViewPlain];

                    [self zmj_initRequest];
                }];
            }
                break;

            default:
                break;
        }
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *zmj_string = @"UITableViewCell";
    
    UITableViewCell *zmj_cell = [tableView dequeueReusableCellWithIdentifier:zmj_string];
    
    if (!zmj_cell) {
        
        zmj_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:zmj_string];
    }
    
    return zmj_cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return zmj_size(50);
}

- (UITableView *)zmj_tableViewPlain {
    if (!_zmj_tableViewPlain) {
        _zmj_tableViewPlain = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _zmj_tableViewPlain.delegate = self;
        _zmj_tableViewPlain.dataSource = self;
        _zmj_tableViewPlain.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
        _zmj_tableViewPlain.tableFooterView = [UIView new];
        
        if (@available(iOS 11.0, *)) {
            
            _zmj_tableViewPlain.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _zmj_tableViewPlain;
}

- (void)zmj_ndvTapAction:(UITapGestureRecognizer *)tap {
    
    [ZMJNoDataView zmj_hideNDVForView:self.zmj_tableViewPlain];
    
    [self zmj_initRequest];
}

- (void)zmj_ndvBtnAction:(UIButton *)btn {
    
    [ZMJNoDataView zmj_hideNDVForView:self.zmj_tableViewPlain];
    
    [self zmj_initRequest];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
