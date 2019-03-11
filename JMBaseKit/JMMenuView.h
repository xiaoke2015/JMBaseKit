//
//  JMMenuView.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/3/11.
//  Copyright © 2019 李加建. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMMenuView : UIView

@property (nonatomic ,strong)NSArray* titles;
@property (nonatomic ,strong)NSArray* images;
@property (nonatomic ,strong)NSArray* details;

@property (nonatomic ,assign)NSInteger maxColumn; // 最大列数量
@property (nonatomic ,assign)NSInteger maxRow; // 最大行数量
@property (nonatomic ,assign)UIEdgeInsets edgeInsets;
@property (nonatomic) CGFloat minimumLineSpacing; // 行间距
@property (nonatomic) CGFloat minimumInteritemSpacing; // 列间距

@property (nonatomic ,strong)UIColor * textColor;
@property (nonatomic ,strong)UIFont * textFont;

@property (nonatomic ,copy)void (^didSelBlock)(NSInteger index);


- (void)drawMenu ;

@end

NS_ASSUME_NONNULL_END
