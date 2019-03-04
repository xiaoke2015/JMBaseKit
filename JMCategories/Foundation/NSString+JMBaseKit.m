//
//  NSString+JMBaseKit.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2019/2/26.
//  Copyright © 2019 李加建. All rights reserved.
//

#import "NSString+JMBaseKit.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JMBaseKit)


#pragma mark - 常用字符串转换

/* 手机号码隐藏中间四位数 */
- (NSString *)phoneHideCenter {

    if(self.length > 7){
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4)  withString:@"****"];

    }
    return self;
}


/* 固定字符串宽度 自适应高度 */
- (CGFloat)heightLayoutFont:(UIFont*)font width:(CGFloat)width {

    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize contenSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;

    return contenSize.height;
}

/* 固定字符串高度 自适应宽度 */
- (CGFloat)widthLayoutFont:(UIFont*)font height:(CGFloat)height {

    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize contenSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;

    return contenSize.width;
}



/* 转换 NSAttributedString */
- (NSAttributedString*)attrWithcolor:(UIColor *)color
                                font:(UIFont *)font
                         lineSpacing:(CGFloat)lineSpacing
                 firstLineHeadIndent:(CGFloat)firstLineHeadIndent  {

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;// 字体的行间距
    paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;// 段落首行间距

    NSDictionary * attributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:paragraphStyle};

    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:self attributes:attributes];

    return attributedString ;
}


#pragma mark - 编码方式

/* Base64 编码 */
- (NSString *)encodeBase64String {
    //先将string转换成data
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];

    NSData *base64Data = [data base64EncodedDataWithOptions:0];

    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];

    return baseString;
}

/* Base64 解码 */
- (NSString *)dencodeBase64String {
    //NSData *base64data = [string dataUsingEncoding:NSUTF8StringEncoding];

    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];

    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

    return string;
}


/* UTF-8 编码 */
- (NSString *)encodeUTF8String {

    NSString * encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    return encodedString ;
}


/* md5 加密  */
- (NSString *)encodemd5String {

    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];

}


#pragma mark - json 转换

/** json对象转字符串 */
+ (NSString*)dictionaryToJson:(id)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options: NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** 字符串转数组或字典 */
- (id)JSONValue {
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}




@end
