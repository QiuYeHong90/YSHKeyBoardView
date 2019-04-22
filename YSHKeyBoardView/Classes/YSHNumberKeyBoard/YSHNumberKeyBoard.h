//
//  YSHNumberKeyBoard.h
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//
#import "YSHDecimalTextField.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 输入框位数
#define NUMBER_TF_DY  13

#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                 //屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                //屏幕长度

#define SYS_DEVICE_BottomSalfe_HEIGHT  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

typedef NS_ENUM(NSUInteger, RYInputType) {
    RYIntInputType,        // 整数键盘
    RYFloatInputType,      // 浮点数键盘
    RYIDCardInputType,     // 身份证键盘
};

@interface YSHNumberKeyBoard : UIView

@property (nonatomic, strong) YSHDecimalTextField<UITextInput> *textInput;
@property (nonatomic, assign) RYInputType inputType;        // 键盘类型
@property (nonatomic, strong) NSNumber *interval;           // 每隔多少个数字空一格

- (id)initWithInputType:(RYInputType)inputType;
@end

NS_ASSUME_NONNULL_END
