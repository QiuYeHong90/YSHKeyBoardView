//
//  YSHDecmialTextFieldView.m
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//

#import <YYKit/YYKit.h>
#import "YSHDecmialTextFieldView.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)

@interface YSHDecmialTextFieldView ()<UITextFieldDelegate>

/**
 输入框 默认隐藏
 */
@property (nonatomic,strong) YSHDecimalTextField * textField;

@end


@implementation YSHDecmialTextFieldView
@dynamic fontSize;

-(void)setFontSize:(NSInteger)fontSize
{
    self.textLab.font = [UIFont systemFontOfSize:fontSize];
}

-(NSInteger)fontSize
{
    return [self.textLab.font pointSize];
}


-(void)setValueStr:(NSString *)valueStr
{
    _valueStr = valueStr;
    
    self.textField.text = valueStr;
    [self.textField textChanged:self.textField];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
    
        YSHDecimalTextField * textField = [YSHDecimalTextField new];
        textField.textAlignment = NSTextAlignmentRight ;
        __weak typeof(self) weakSelf = self ;
        textField.CallBlock = ^(NSString * _Nonnull value,NSString * seeValue) {
            NSLog(@"textField == %@",value);
            
            weakSelf.textLab.text = seeValue;
            if ([seeValue isEqualToString:@""]||seeValue==nil) {
                weakSelf.textLab.text = @"0.00";
            }
            if (weakSelf.CallBlock) {
                weakSelf.CallBlock(value, seeValue);
            }
            
        };
        
        
        self.textField = textField ;
        self.textField.hidden = YES ;
        [self addSubview:self.textField];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
        
//        textLab
        UILabel * textLab = [UILabel new];
        textLab.textAlignment = NSTextAlignmentRight ;
        
        textLab.font = [UIFont systemFontOfSize:24];
        if (IS_IPHONE_5) {
            textLab.font = [UIFont systemFontOfSize:20];
        }
        
        textLab.textColor = [UIColor colorWithHexString:@"333333"];
        [self addSubview:textLab];
        self.textLab = textLab;
        self.textLab.text = @"0.00";
    }
    return self;
}

-(void)tapClick:(UITapGestureRecognizer *)tap
{
    if (!self.textField.isFirstResponder) {
        [self.textField becomeFirstResponder];
    }else{
        [self.textField resignFirstResponder];
    }
    
}
//textFieldDidChange
-(void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"text --%@",textField.text);
    
    self.textLab.text = textField.text ;
    
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    self.textField.frame = self.bounds;
    self.textLab.frame = self.bounds ;
    self.textLab.right =self.bounds.size.width - 15;
}



-(void)dealloc
{
    NSLog(@"释放YSHDecmialTextFieldView");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end