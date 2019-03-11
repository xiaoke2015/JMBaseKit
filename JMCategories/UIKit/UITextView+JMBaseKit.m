//
//  UITextView+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/3/11.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "UITextView+JMBaseKit.h"
#import <objc/runtime.h>

@interface UITextView ()

@property (nonatomic ,strong)UILabel * placeHolderLabel;

@end

@implementation UITextView (JMBaseKit)



#pragma mark - placeHolderLabel
static char * placeHolderLabelkey = "placeHolderLabelkey";

- (void)setPlaceHolderLabel:(UILabel *)placeHolderLabel {
    objc_setAssociatedObject(self, placeHolderLabelkey, placeHolderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel*)placeHolderLabel {

    UILabel *placeHolderLabel = objc_getAssociatedObject(self, placeHolderLabelkey);
    if (!placeHolderLabel) {
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.textColor = [UIColor lightGrayColor];
        [self setPlaceHolderLabel:placeHolderLabel];

    }
    return placeHolderLabel;

}


- (void)layoutSubviews {

    if (self.jm_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.placeHolderLabel.frame = CGRectMake(x, y, width, height);

    }
}


#pragma mark - placeHolder
static char * placeHolderkey = "placeHolderkey";
- (void)setJm_placeHolder:(NSString *)jm_placeHolder {
    objc_setAssociatedObject(self, placeHolderkey, jm_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self updatePlaceHolder];
    // 核心代码
    [self setValue:self.placeHolderLabel forKey:@"_placeholderLabel"];

}

- (NSString*)jm_placeHolder {
    return objc_getAssociatedObject(self, placeHolderkey);
}



- (void)updatePlaceHolder {

    self.placeHolderLabel.font = self.font?self.font:[UIFont systemFontOfSize:12];
    self.placeHolderLabel.textAlignment = self.textAlignment;
    self.placeHolderLabel.text = self.jm_placeHolder;
    [self insertSubview:self.placeHolderLabel atIndex:0];

}


#pragma mark - placeHolderColor
static char * placeHolderColorkey = "placeHolderColorkey";
- (void)setJm_placeHolderColor:(UIColor *)jm_placeHolderColor {

    objc_setAssociatedObject(self, placeHolderColorkey, jm_placeHolderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.placeHolderLabel.textColor = jm_placeHolderColor;
}


- (UIColor*)jm_placeHolderColor {
    return objc_getAssociatedObject(self, placeHolderColorkey);
}



@end
