//
//  UIViewController+JMBaseKit.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JMBaseKit)

@property (nonatomic ,strong)UINavigationBar * navigationBar;
@property (nonatomic ,strong)UIImage *backItemImage;



- (void)automaticallyAdjustsScrollView:(UIScrollView*)scrollView ;


@end

NS_ASSUME_NONNULL_END
