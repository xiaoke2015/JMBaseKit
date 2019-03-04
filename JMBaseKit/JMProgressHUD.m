//
//  JMProgressHUD.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/1/18.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "JMProgressHUD.h"

@interface JMProgressHUD ()

@property(nonatomic,strong)UIWindow * keyWindow ;
@property(nonatomic,strong)UIView * hudView ;
@property(nonatomic,strong)UIImageView * imageView ;
@property(nonatomic,strong)UILabel * textLabel ;
@property(nonatomic,strong)UIActivityIndicatorView * indicatorView ;

@property(nonatomic,assign)BOOL isShow ;
@property(nonatomic,assign)JMProgressHUDMode mode ;

@end

@implementation JMProgressHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (JMProgressHUD *)shareInstance {
    static JMProgressHUD *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        instance = [[JMProgressHUD alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return instance;
}

#pragma mark - 懒加载 属性

- (UIWindow *)keyWindow {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    _keyWindow = window;
    return _keyWindow;
}



- (UIView*)hudView {

    if(_hudView == nil){
        _hudView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _hudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        [self addSubview:_hudView];
        _hudView.center = self.center;
        _hudView.clipsToBounds = YES;
        _hudView.layer.cornerRadius = 10;
    }
    return _hudView;
}


- (UILabel*)textLabel {

    if(_textLabel == nil){
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:16];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

- (UIImageView*)imageView {

    if(_imageView == nil){
        _imageView = [[UIImageView alloc] init];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;

    }
    return _imageView;
}


- (UIActivityIndicatorView*)indicatorView {

    if(_indicatorView == nil){

        _indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhite)];
        //设置小菊花的frame
        _indicatorView.frame= CGRectMake(0, 0, 100, 100);
        //设置小菊花颜色
        _indicatorView.color = [UIColor whiteColor];

        //只是没有在转动而已，没有设置或者设置为YES的时候，刚进入页面不会显示
        _indicatorView.hidesWhenStopped = NO;

        CGAffineTransform transform = CGAffineTransformMakeScale(1.7f, 1.7f);
        _indicatorView.transform = transform;

        [_indicatorView startAnimating];

    }
    return _indicatorView;
}


#pragma mark - show 展示


+ (void)showIndicator {

    [[JMProgressHUD shareInstance] showText:@"" mode:JMProgressHUDModeIndicator delay:-1];
}

+ (void)hideIndicator {

//    [[JMProgressHUD shareInstance] showText:@"" mode:JMProgressHUDModeIndicator delay:0];
    [[JMProgressHUD shareInstance] dismissafterDelay:0];
}


+ (void)showText:(NSString*)text delay:(NSTimeInterval)delay {

    [[JMProgressHUD shareInstance] showText:text mode:JMProgressHUDModeText delay:delay];
}

+ (void)showIndicatorText:(NSString*)text {

    [[JMProgressHUD shareInstance] showText:text  mode:JMProgressHUDModeIndicatorText delay:-1];
}

+ (void)hideIndicatorText:(NSString*)text {

    [[JMProgressHUD shareInstance] showText:text mode:JMProgressHUDModeIndicatorText delay:0];
}



/**
 show  JMProgressHUD

 @param text 文字
 @param mode 样式
 @param delay 延时
 */
- (void)showText:(NSString*)text mode:(JMProgressHUDMode)mode delay:(NSTimeInterval)delay {

    [self.indicatorView removeFromSuperview];
    [self.textLabel removeFromSuperview];
    [self.imageView removeFromSuperview];

    [self.keyWindow addSubview:self];

    if(mode == JMProgressHUDModeText){

        [self setHUDText:text];

    }
    else if (mode == JMProgressHUDModeIndicator){

        self.hudView.frame = CGRectMake(0, 0, 100, 100);

        [self.hudView addSubview:self.indicatorView];
        // 设置位置
        self.hudView.center = CGPointMake(self.center.x, self.center.y - 40);
    }
    else if (mode == JMProgressHUDModeIndicatorText){

        [self setHUDIndicatorText:text];
    }
    else if (mode == JMProgressHUDModeCustomView){


    }
    
    self.userInteractionEnabled = YES;
    // 动画效果
    self.hudView.transform = CGAffineTransformScale(self.hudView.transform, 1.3, 1.3);

    if(_isShow == NO){

        UIViewAnimationOptions option = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState ;

        [UIView animateWithDuration:0.15 delay:0 options:option animations:^{

            self.hudView.transform = CGAffineTransformScale(self.hudView.transform, 1/1.3, 1/1.3);
            self.hudView.alpha = 1;

        } completion:^(BOOL finished) {

            [self dismissafterDelay:delay];

        }];
    }
    else {

        self.hudView.transform = CGAffineTransformScale(self.hudView.transform, 1/1.3, 1/1.3);
        self.hudView.alpha = 1;
        [self dismissafterDelay:delay];
    }

    _isShow = YES;

}



- (void)setHUDText:(NSString*)text {

    self.textLabel.text = text;

    NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading;

    CGRect rect = [text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:option attributes:@{NSFontAttributeName:self.textLabel.font} context:nil];

    // textLabel 大小设置
    CGRect rect3 = rect;
    rect3.origin = CGPointMake(15, 20);
    self.textLabel.frame = rect3;

    // hudView 大小设置
    CGRect rect2 = rect;
    rect2.size = CGSizeMake(rect.size.width + 30, rect.size.height + 40);
    self.hudView.frame = rect2;
    [self.hudView addSubview:self.textLabel];

    // 设置位置
    self.hudView.center = CGPointMake(self.center.x, self.center.y - CGRectGetHeight(self.hudView.frame)/2);
}


- (void)setHUDIndicatorText:(NSString*)text {

    self.textLabel.text = text;

    NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading;

    CGRect rect = [text boundingRectWithSize:CGSizeMake(100, MAXFLOAT) options:option attributes:@{NSFontAttributeName:self.textLabel.font} context:nil];

    // textLabel 大小设置
    CGRect rect3 = rect;
    rect3.origin = CGPointMake(10, 80);
    rect3.size = CGSizeMake(100, 20);
    self.textLabel.frame = rect3;

    self.indicatorView.frame = CGRectMake(10, 0, 100, 100);
    [self.hudView addSubview:self.indicatorView];

    // hudView 大小设置
    CGRect rect2 = rect;
    rect2.size = CGSizeMake(120, rect.size.height + 100);
    self.hudView.frame = rect2;
    [self.hudView addSubview:self.textLabel];

    // 设置位置
    self.hudView.center = CGPointMake(self.center.x, self.center.y - 40);
}



#pragma mark - dismiss 消失
/**
 延时多少秒

 @param delay 时间
 */
- (void)dismissafterDelay:(NSTimeInterval)delay {

    if(delay >= 0){
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:delay];
    }
}


- (void)dismiss {

    [UIView animateWithDuration:0.15 animations:^{
        self.hudView.alpha = 0;
    } completion:^(BOOL finished) {

        self.isShow = NO;
        [self removeFromSuperview];
    }];

}





@end
