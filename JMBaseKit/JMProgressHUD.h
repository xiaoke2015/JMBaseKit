//
//  JMProgressHUD.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/1/18.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, JMProgressHUDMode) {

    JMProgressHUDModeIndicator = 0,

    JMProgressHUDModeIndicatorText,
    /// Shows a custom view.
    JMProgressHUDModeCustomView,
    /// Shows only labels.
    JMProgressHUDModeText
};

NS_ASSUME_NONNULL_BEGIN

@interface JMProgressHUD : UIView


+ (void)showIndicator ;
+ (void)hideIndicator ;

+ (void)showText:(NSString*)text delay:(NSTimeInterval)delay ;

+ (void)showIndicatorText:(NSString*)text ;
+ (void)hideIndicatorText:(NSString*)text ;

@end



CG_INLINE void UJMHUDShow(NSString * text ,NSTimeInterval delay) {

    [JMProgressHUD showText:text delay:delay];
}

CG_INLINE void UJMHUDShowIndicator(NSString * text) {

    [JMProgressHUD showIndicatorText:text];
}

CG_INLINE void UJMHUDHideIndicator(void) {

    [JMProgressHUD hideIndicator];
}

NS_ASSUME_NONNULL_END
