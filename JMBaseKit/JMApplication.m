//
//  JMApplication.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/25.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "JMApplication.h"

#import <sys/utsname.h>



@implementation JMApplication


/**
 单列初始化

 @return JMAppConst 单列初始化
 */
+ (JMApplication *)instance {
    static JMApplication *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{

        instance = [[JMApplication alloc] init];
    });
    return instance;
}


- (instancetype)init {

    self = [super init];
    if(self){

        CGRect bounds = [UIScreen mainScreen].bounds;

        _bounds  = bounds;
        _size    = bounds.size;
        _width   = bounds.size.width;
        _height  = bounds.size.height;
        
        _iPhoneX = [self isIPhoneX];
        _safeAreaInsets = [self getSafeAreaInsets];

        _tabBar = 50 + _safeAreaInsets.bottom;
        _navBar = 44 + _safeAreaInsets.top;
        _body   = _height - _tabBar - _navBar;
        _scale  = MAX(_size.width/375.f, 1);


        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];

    }
    return self;
}


- (void)orientChange:(NSNotification *)noti {

    CGRect bounds = [UIScreen mainScreen].bounds;

    _bounds  = bounds;
    _size    = bounds.size;
    _width   = bounds.size.width;
    _height  = bounds.size.height;

    UIDeviceOrientation  orient = [UIDevice currentDevice].orientation;
    switch (orient) {
        case UIDeviceOrientationPortrait:
            break;
        case UIDeviceOrientationLandscapeLeft:
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            break;
        case UIDeviceOrientationLandscapeRight:
            break;
        default:
            break;
    }
}



- (BOOL)isIPhoneX {

    CGSize size = [UIScreen mainScreen].bounds.size;
    BOOL iPhoneX = CGSizeEqualToSize(size, CGSizeMake(375, 812)) ||
                   CGSizeEqualToSize(size, CGSizeMake(812, 375)) ||
                   CGSizeEqualToSize(size, CGSizeMake(414, 896)) ||
                   CGSizeEqualToSize(size, CGSizeMake(896, 414)) ;

    return iPhoneX;
}


- (UIEdgeInsets)getSafeAreaInsets {

    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if(@available(iOS 11.0, *)){

        UIWindow * window = [UIApplication sharedApplication].delegate.window;
        safeAreaInsets = window.safeAreaInsets;
    }
    return safeAreaInsets;
}


@end



@implementation JMApplication (UIKit)



- (NSString*)name {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
    return [appName copy];
}


- (UIImage*)icon {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appIconStr = [[infoDic valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    return [UIImage imageNamed:appIconStr];
}


- (NSString*)version {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return [appVersion copy];
}


- (NSString*)build {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return [appBuildVersion copy];
}

- (NSString *)bundleId {

    return [[NSBundle mainBundle] bundleIdentifier];
}



- (NSString *)systemVersion {

    return [UIDevice currentDevice].systemVersion;
}


- (NSString *)currentLanguage {

    return [[NSLocale preferredLanguages] objectAtIndex:0];

}


- (BOOL)isZH_Han {

    NSString * currentLanguage = [self currentLanguage];
    return [currentLanguage isEqualToString:@"zh-Hans-CN"] || [currentLanguage isEqualToString:@"zh-Hans"];
}





- (void)openURL:(NSString *)url {

    if (@available(iOS 10.0, *)) {

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];

    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
#pragma clang diagnostic pop
    }
}


/**
 ios 10 震动反馈
 */
- (void)impactFeedback {

    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleMedium];
        [impactLight impactOccurred];
    } else {
        // Fallback on earlier versions
    }

}


- (NSString *)AppStoreURL:(NSString*)id {

    return [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@?mt=8",id];
}


- (NSString *)JMAppStoreReviewURL:(NSString*)id {

    return [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8&action=write-review",id];
}


- (NSString*)phoneType {


    struct utsname systemInfo;
    uname(&systemInfo);
    NSString*phoneType = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];

    if([phoneType  isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if([phoneType  isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if([phoneType  isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if([phoneType  isEqualToString:@"iPhone11,2"]) return @"iPhone XS";

    if([phoneType  isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if([phoneType  isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if([phoneType  isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([phoneType  isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([phoneType  isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([phoneType  isEqualToString:@"iPhone10,1"]) return @"iPhone 8";

    if([phoneType  isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    if([phoneType  isEqualToString:@"iPhone9,1"])  return @"iPhone 7";

    if([phoneType  isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    if([phoneType  isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if([phoneType  isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";

    if([phoneType  isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if([phoneType  isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";

    if([phoneType  isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    if([phoneType  isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    if([phoneType  isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    if([phoneType  isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    if([phoneType  isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    if([phoneType  isEqualToString:@"iPhone5,1"])  return @"iPhone 5";

    if([phoneType  isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    if([phoneType  isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";

    if([phoneType  isEqualToString:@"x86_64"])     return @"iOS simulator";
    if([phoneType  isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    if([phoneType  isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    if([phoneType  isEqualToString:@"iPhone3,1"])  return @"iPhone 4";

    if([phoneType  isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if([phoneType  isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if([phoneType  isEqualToString:@"iPhone1,1"])  return @"iPhone 2G";


    return @"";

}




- (NSString *)documentsPath {

    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)cachesPath {

    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSURL *)cachesURL {

    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSURL *)documentsURL {

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSURL *)libraryURL {

    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}




@end
