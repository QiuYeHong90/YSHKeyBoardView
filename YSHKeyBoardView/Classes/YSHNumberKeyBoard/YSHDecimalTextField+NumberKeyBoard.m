//
//  YSHDecimalTextField+NumberKeyBoard.m
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//YSHNumberKeyBoard
#import <objc/runtime.h>
#import "YSHDecimalTextField+NumberKeyBoard.h"

@implementation YSHDecimalTextField (NumberKeyBoard)

#pragma mark -
#pragma mark -  Setter

- (void)setRy_inputType:(RYInputType)ry_inputType
{
    YSHNumberKeyBoard *inputView = [[YSHNumberKeyBoard alloc] initWithInputType:ry_inputType];

    self.inputView = inputView;
    inputView.textInput = self;
    objc_setAssociatedObject(self, _cmd, @(ry_inputType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setRy_interval:(NSInteger)ry_interval
{
    if([self.inputView isKindOfClass:[YSHNumberKeyBoard class]])
        [self.inputView performSelector:@selector(setInterval:) withObject:@(ry_interval)];
    objc_setAssociatedObject(self, _cmd, @(ry_interval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setRy_inputAccessoryText:(NSString *)ry_inputAccessoryText
{
    // inputAccessoryView
    UIView *tView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SYS_DEVICE_WIDTH, 35)];
    // 顶部分割线
    UIView *tLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SYS_DEVICE_WIDTH, 0.5)];
    tLine.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    // 字体label
    UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SYS_DEVICE_WIDTH, 35)];
    tLabel.text = ry_inputAccessoryText;
    tLabel.textAlignment = NSTextAlignmentCenter;
    tLabel.font = [UIFont systemFontOfSize:14.0];
    tLabel.backgroundColor = [UIColor whiteColor];
    
    [tView addSubview:tLabel];
    [tView addSubview:tLine];
    self.inputAccessoryView = tView;
    objc_setAssociatedObject(self, _cmd, ry_inputAccessoryText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -
#pragma mark -  Getter

- (RYInputType)ry_inputType
{
    return [objc_getAssociatedObject(self, @selector(setRy_inputType:)) integerValue];
}

- (NSInteger)ry_interval
{
    return [objc_getAssociatedObject(self, @selector(setRy_interval:)) integerValue];
}

- (NSString *)ry_inputAccessoryText
{
    return objc_getAssociatedObject(self, @selector(ry_inputAccessoryText));
}

@end
