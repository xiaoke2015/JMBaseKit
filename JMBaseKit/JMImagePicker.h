//
//  JMImagePicker.h
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/28.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PickerType)
{
    JMPickerType_Camera = 0, // 拍照
    JMPickerType_Photo = 1, // 照片
    JMPickerType_Video = 2, // 视频
};

typedef void(^CallBackBlock)(NSDictionary *infoDict, BOOL isCancel);  // 回调

@interface JMImagePicker : NSObject

@property (nonatomic ,assign)BOOL allowsEditing;


+ (JMImagePicker *)shareInstance ;

- (void)presentPicker:(PickerType)pickerType target:(UIViewController *)vc callBackBlock:(CallBackBlock)callBackBlock ;


// 获取图片
+ (UIImage*)imageWithInfo:(NSDictionary*)info ;
+ (UIImage*)imageWithInfo:(NSDictionary*)info type:(NSString*)mediatype  ;
// 获取视频地址
+ (NSString*)urlWithInfo:(NSDictionary*)info ;

@end
