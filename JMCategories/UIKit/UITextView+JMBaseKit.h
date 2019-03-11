//
//  UITextView+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/3/11.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JMBaseKit)<UITextViewDelegate>

@property (nonatomic ,strong)NSString * jm_placeHolder;

@property (nonatomic ,strong)UIColor * jm_placeHolderColor;



@end

NS_ASSUME_NONNULL_END
