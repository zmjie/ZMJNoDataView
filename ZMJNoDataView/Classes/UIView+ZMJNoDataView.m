//
//  UIView+ZMJNoDataView.m
//  ZMJNoDataView
//
//  Created by zmjie on 2019/12/23.
//

#import "UIView+ZMJNoDataView.h"

@implementation UIView (ZMJNoDataView)

- (void)setZmj_width:(CGFloat)zmj_width {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.size.width = zmj_width;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_width {
    
    return self.frame.size.width;
}

- (void)setZmj_height:(CGFloat)zmj_height {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.size.height = zmj_height;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_height {
    
    return self.frame.size.height;
}

- (void)setZmj_x:(CGFloat)zmj_x {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.origin.x = zmj_x;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_x {
    
    return self.frame.origin.x;
}

- (void)setZmj_y:(CGFloat)zmj_y {
    
    CGRect zmj_rect = self.frame;
    zmj_rect.origin.y = zmj_y;
    self.frame = zmj_rect;
}

- (CGFloat)zmj_y {
    
    return self.frame.origin.y;
}

- (void)setZmj_centerX:(CGFloat)zmj_centerX {
    
    CGPoint zmj_rect = self.center;
    zmj_rect.x = zmj_centerX;
    self.center = zmj_rect;
}

- (CGFloat)zmj_centerX {
    
    return self.center.x;
}

- (void)setZmj_centerY:(CGFloat)zmj_centerY {
    
    CGPoint zmj_rect = self.center;
    zmj_rect.y = zmj_centerY;
    self.center = zmj_rect;
}

- (CGFloat)zmj_centerY {
    
    return self.center.y;
}

@end
