//
//  JMAppConst.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/12/24.
//  Copyright © 2018 李加建. All rights reserved.
//

#import "JMAppConst.h"

@implementation JMAppConst


+ (JMAppConst *)manager {
    static JMAppConst *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        instance = [[JMAppConst alloc] init];
    });
    return instance;
}


- (instancetype)init {

    self = [super init];
    if(self){

        CGSize size = [UIScreen mainScreen].bounds.size;
        _width = size.width;
        _height = size.height;
        _size = size;
        _scale = MAX(size.width/375.f, 1);

        _iPhoneX = CGSizeEqualToSize(size, CGSizeMake(375, 812)) ||
        CGSizeEqualToSize(size, CGSizeMake(812, 375)) ||
        CGSizeEqualToSize(size, CGSizeMake(414, 896)) ||
        CGSizeEqualToSize(size, CGSizeMake(896, 414)) ;

        _tabBar = _iPhoneX ? 84 : 50;
        _navBar = _iPhoneX ? 88 : 64;
        _body = _height - _tabBar - _navBar;

    }
    return self;
}




// app 名称
- (NSString*)name {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
    return [appName copy];
}

// app icon
- (NSString*)icon {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appIconStr = [[infoDic valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return [appIconStr copy];
}

// app 版本
- (NSString*)version {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return [appVersion copy];
}

// app 版本 build
- (NSString*)build {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return [appBuildVersion copy];
}



// ios 10 震动反馈
+ (void)impactFeedback {

    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleMedium];
        [impactLight impactOccurred];
    } else {
        // Fallback on earlier versions
    }

}

@end
