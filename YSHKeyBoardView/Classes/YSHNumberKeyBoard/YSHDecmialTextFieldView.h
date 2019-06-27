//
//  YSHDecmialTextFieldView.h
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//

typedef NS_ENUM(NSUInteger, YSHDecmialTextFieldViewType) {
    YSHDecmialTextFieldViewTypeDefalut = 0,
    YSHDecmialTextFieldViewTypeSmall,
    YSHDecmialTextFieldViewTypeHelath,
};

#import "YSHDecimalTextField.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHDecmialTextFieldView : UIView

@property(nonatomic,assign) IBInspectable NSInteger fontSize;   

@property (nonatomic,copy) NSString * placeholder;

/**
 0 默认 1 小框输入 2 身高体重
 */
@property (nonatomic,assign) IBInspectable YSHDecmialTextFieldViewType typeIput;

/**
 输入框 默认隐藏
 */
@property (nonatomic,strong) UILabel * textLab;

@property (nonatomic,copy) void(^CallBlock)(NSString * value,NSString * seeValue);
@property (nonatomic,copy) NSInteger(^numMaxLenght)(void);
@property (nonatomic,copy) NSInteger(^floatMaxLenght)(void);
@property (nonatomic,copy) NSString * valueStr;
/**
 唤起键盘
 */
-(void)tapClick:(UITapGestureRecognizer *)tap;
@end

NS_ASSUME_NONNULL_END
