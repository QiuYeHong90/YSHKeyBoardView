//
//  YSHDecimalTextField.h
//  JianPanNum
//  数字键盘
//  Created by shuhui on 2019/4/10.
//  Copyright © 2019 cqdunyue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHDecimalTextField : UITextField<UITextFieldDelegate>

/**
 数据库存储
 */
@property (nonatomic,copy) NSString * numText;

@property (nonatomic,copy) void(^CallBlock)(NSString * value,NSString * seeValue);

@property (nonatomic,copy) NSInteger (^numMaxLenght)(void);
/**
 0 中国国际通用
 1 越南
 2 其他
 */
@property (nonatomic,assign) NSInteger decimalType;
/**
 0 中国国际通用
 1 越南
 2 其他
 */
+(NSInteger)decimalType;
- (BOOL)textField:(UITextField *)textField  replacementString:(NSString *)string;
-(void)clearWeiLing;
- (void)textChanged:(UITextField *)textField;
@end

NS_ASSUME_NONNULL_END
