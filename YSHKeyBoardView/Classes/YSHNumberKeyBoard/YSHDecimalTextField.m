//
//  YSHDecimalTextField.m
//  JianPanNum
//
//  Created by shuhui on 2019/4/10.
//  Copyright © 2019 cqdunyue. All rights reserved.
//
#import "YSHKeyBoardSingle.h"
#import "YSHDecimalTextField+NumberKeyBoard.h"
#import "NSString+YSHDecimal.h"
#import "YSHDecimalTextField.h"



@interface YSHDecimalTextField ()

@property (nonatomic,assign) NSString * originNum;
@property (nonatomic,assign) NSRange gbRange;


@end


@implementation YSHDecimalTextField




-(NSString *)originNum
{
    return [self.text textDecimalForamt];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
         [self setUpUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    
        [self setUpUI];
    }
    return self;
}


-(void)setUpUI
{
    self.ry_inputType = RYFloatInputType;
    [self addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
}


-(void)textField:(UITextField *)textField range:(NSRange)range
{
    textField.text = [textField.text substringWithRange:range];
}


- (BOOL)textField:(UITextField *)textField  replacementString:(NSString *)string
{

    
    
    NSString * text = textField.text;
    NSString * appendStr = string;
    NSString * textA = [text stringByAppendingString:appendStr];
    NSString * testAB = [textA textDecimalForamt];
    if ([self isPureInt:testAB]||[self isPureFloat:testAB]) {
        //            加
        NSInteger num = NUMBER_TF_DY;
        if (self.numMaxLenght) {
            num = self.numMaxLenght();
        }
        if ([self isPureInt:testAB]) {
            if (testAB.length>(num-3)) {
                return NO;
            }
        }
        if ([self isPureFloat:testAB]) {
            if (testAB.length>num) {
                return NO;
            }
        }
        
        return YES;
    }
    return NO;
    
    
}



//判断是否为整形：

- (BOOL)isPureInt:(NSString*)string{
    
    NSString * nowStr = string;
    
    NSScanner* scan = [NSScanner scannerWithString:nowStr];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
    
}
//判断是否为浮点形：
- (BOOL)isPureFloat:(NSString*)string{
    
    NSString * nowStr = string;
    
    NSScanner* scan = [NSScanner scannerWithString:nowStr];
    float val;
    BOOL flag = [scan scanFloat:&val]&&[scan isAtEnd];
    if (flag) {
        NSArray *tempArr = [nowStr componentsSeparatedByString:@"."];
        NSString * tempStr = [tempArr lastObject];
        NSInteger floatNum = 3;
        if (self.floatMaxLenght) {
           floatNum = self.floatMaxLenght();
        }
        return  tempStr.length<floatNum;
    }
    return flag;
    
}


- (void)textChanged:(UITextField *)textField {
    NSString * dian = [NSString numberCodeDict][@"dian"];
    self.text = [self.text stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@",dian,dian] withString:dian];
    if (self.CallBlock) {
        NSLog(@"self.text--%@",self.text);
        
        self.CallBlock(self.originNum,[self.originNum encodeDecimalChangeformat]);
    }
    
   
}




+(NSInteger)decimalType
{
    
    return [YSHKeyBoardSingle sharedInstance].type;
    
}

-(void)clearWeiLing
{
    self.text = @"";
    [self textChanged:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
