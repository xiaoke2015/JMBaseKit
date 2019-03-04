//
//  UIView+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "UIView+JMBaseKit.h"

@implementation UIView (JMBaseKit)


- (void)setTop:(CGFloat)top {

    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom {

    CGRect frame = self.frame;
    frame.size.height = bottom - frame.origin.y;
    self.frame = frame;
}


- (void)setLeft:(CGFloat)left {

    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


- (void)setRight:(CGFloat)right {

    CGRect frame = self.frame;
    frame.size.width = right - frame.origin.x;
    self.frame = frame;

}

- (void)setWidth:(CGFloat)width {

    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (void)setHeight:(CGFloat)height {

    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGFloat)top {

    return CGRectGetMinY(self.frame);
}

- (CGFloat)bottom {

    return CGRectGetMaxY(self.frame);
}

- (CGFloat)left {

    return CGRectGetMinX(self.frame);
}

- (CGFloat)right {

    return CGRectGetMaxX(self.frame);
}

- (CGFloat)width {

    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {

    return CGRectGetHeight(self.frame);
}


@end
