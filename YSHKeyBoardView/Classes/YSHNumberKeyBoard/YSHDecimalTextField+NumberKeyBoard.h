//
//  YSHDecimalTextField+NumberKeyBoard.h
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//
#import "YSHNumberKeyBoard.h"
#import "YSHDecimalTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSHDecimalTextField (NumberKeyBoard)
@property (nonatomic, assign) RYInputType ry_inputType;     // 键盘类型
@property (nonatomic, assign) NSInteger ry_interval;        // 每隔多少个数字空一格
@property (nonatomic, copy) NSString *ry_inputAccessoryText;  // inputAccessoryView显示的文字

@end

NS_ASSUME_NONNULL_END
