//
//  JMImagePicker.m
//  JMBaseKitExample
//
//  Created by 李加建 on 2018/6/28.
//  Copyright © 2018年 李加建. All rights reserved.
//

#import "JMImagePicker.h"

#import <MobileCoreServices/MobileCoreServices.h>

@interface JMImagePicker ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic ,strong)UIImagePickerController * imgPicker;

@property (nonatomic , strong)UIViewController * vc;
@property (nonatomic , copy)CallBackBlock  callBackBlock;


@end



@implementation JMImagePicker


+ (JMImagePicker *)shareInstance {
    
    static JMImagePicker *imagePicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imagePicker = [self new];
    });
    return imagePicker;
}


- (instancetype)init {
    
    if([super init]){
        if(!_imgPicker){
            _imgPicker = [[UIImagePickerController alloc] init];  // 初始化 _imgPickC
        }
    }
    
    return self;
}


- (void)presentPicker:(PickerType)pickerType target:(UIViewController *)vc callBackBlock:(CallBackBlock)callBackBlock
{
    _vc = vc;
    _callBackBlock = callBackBlock;
    if(pickerType == JMPickerType_Camera){
        [self sourceTypeCamera];
    }
    else if(pickerType == JMPickerType_Photo){
        [self sourceTypeSavedPhotosAlbum];
    }
    else if(pickerType == JMPickerType_Video){
        [self sourceTypeVideo];
    }
}


- (void)sourceTypeCamera {
    // 拍照
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        _imgPicker.delegate = self;
        _imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imgPicker.allowsEditing = YES;
        _imgPicker.showsCameraControls = YES;
        
        [_vc presentViewController:_imgPicker animated:YES completion:nil];
    }
    else{
        NSLog(@"无相机");
    }
    
}

- (void)sourceTypeSavedPhotosAlbum {
    
    // 相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        _imgPicker.delegate = self;
        _imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [_vc presentViewController:_imgPicker animated:YES completion:nil];
    }else{
        NSLog(@"无相机");
    }
}

- (void)sourceTypeVideo {
    
    // 相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        _imgPicker.delegate = self;
        _imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imgPicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        [_vc presentViewController:_imgPicker animated:YES completion:nil];
    }else{
        NSLog(@"无相机");
    }
}


- (void)setAllowsEditing:(BOOL)allowsEditing {
    
    _imgPicker.allowsEditing = allowsEditing;
}






#pragma mark ---- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [_vc dismissViewControllerAnimated:YES completion:^{
        _callBackBlock(info, NO); // block回调
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_vc dismissViewControllerAnimated:YES completion:^{
        _callBackBlock(nil, YES); // block回调
    }];
}



+ (UIImage*)imageWithInfo:(NSDictionary*)info  {
    
    UIImage *image;
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        //得到照片
        image = info[UIImagePickerControllerOriginalImage];
    }
    return image;
}

+ (UIImage*)imageWithInfo:(NSDictionary*)info type:(NSString*)mediatype {
    
    UIImage *image;
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        //得到照片
        image = info[mediatype];
    }
    return image;
}



+ (NSString*)urlWithInfo:(NSDictionary*)info {
    NSString * url ;
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.movie"]){
        
        url = info[@"UIImagePickerControllerMediaURL"];
    }
    return url;
}








@end
