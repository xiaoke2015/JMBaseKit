//
//  UINavigationBar+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (JMBaseKit)

@property (nonatomic ,strong)UIImage * backgroundImage;
@property (nonatomic ,strong)UIColor * backgroundColor;
@property (nonatomic ,strong)UIColor * shadowColor;

@property (nonatomic ,strong)UIColor * textColor;
@property (nonatomic ,strong)UIFont * font;


- (void)clearColor ;

@end

NS_ASSUME_NONNULL_END
