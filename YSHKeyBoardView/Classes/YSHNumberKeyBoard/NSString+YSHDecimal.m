//
//  NSString+YSHDecimal.m
//  JianPanNum
//
//  Created by shuhui on 2019/4/10.
//  Copyright © 2019 cqdunyue. All rights reserved.
//

#import "NSString+YSHDecimal.h"

@implementation NSString (YSHDecimal)

/**
 此为小数时候支持
 */
-(NSString *)encodeDecimalChangeformat
{
    
    NSArray * tempArr = [self componentsSeparatedByString:@"."];
    if (tempArr.count==0) {
        //        只有整数
        return @"0.00";
    }
    NSString * xiaoShu ;
    NSString * num ;
    if (tempArr.count==2) {
        //        只有整数
        xiaoShu = tempArr.lastObject;
    }
    num = tempArr.firstObject;
    if (num.length>12) {
        //        科学计数法 总长度15 3 5
        NSInteger allLength = 15;
        NSInteger eLength = [NSString stringWithFormat:@"%ld",num.length-1].length+1;
        NSInteger rms = allLength-eLength-2;
        
        return [self toExponent:[self doubleValue] rms:rms];
        
    }
    num = [NSString stringWithFormat:@"%lld",num.longLongValue];
    
    NSString * code = [self numberCodeDict][@"code"];
    NSString * dian = [self numberCodeDict][@"dian"];
    
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:code atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    
    if (xiaoShu) {
        return [NSString stringWithFormat:@"%@%@%@",newstring,dian,xiaoShu];
    }
    
    
    return newstring;
}


/*
 科学计数法，保留n个有效值
 */

-(NSString *)toExponent:(double)d rms:(NSInteger)n
{
    
    
    if(n==0)
    {
        return nil;
    }
    //科学计算法 一般写法4.232E这种样式 这里的n代表所有数字的个数 所以这里n++
    n++;
    //判断小数的位数是否超过设定的n的值 如果超过了保留n位有效数字 如果不超过则保留默认小数位数
    //先将double转换成字符串
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *dbStr = [formatter stringFromNumber:[NSDecimalNumber numberWithDouble:d]];
    NSInteger length = dbStr.length;
    if ([dbStr containsString:@"."]) {
        length = dbStr.length - 1;
    }
    if (length < n) {
        n = length;
    }
    
    CFLocaleRef currentLocale = CFLocaleCopyCurrent();
    CFNumberFormatterRef customCurrencyFormatter = CFNumberFormatterCreate
    (NULL, currentLocale, kCFNumberFormatterCurrencyStyle);
    NSString *s_n = @"#";
    if(n > 1)
    {
        for(int j = 0; j < n; j++)
        {
            NSString *temp = s_n;
            if(j == 0)
            {
                s_n = [temp stringByAppendingString:@"."];
            }
            else
            {
                s_n = [temp stringByAppendingString:@"0"];
            }
            
        }
        
    }
    CFNumberFormatterSetFormat(customCurrencyFormatter, (CFStringRef)s_n);
    
    double i=1;
    int exponent = 0;
    while (1) {
        i = i*10;
        if(d < i)
        {
            break;
        }
        exponent++;
    }
    double n1 = d * 10 / i;
    
    CFNumberRef number1 = CFNumberCreate(NULL, kCFNumberDoubleType, &n1);
    CFStringRef string1 = CFNumberFormatterCreateStringWithNumber
    (NULL, customCurrencyFormatter, number1);
    NSLog(@"%@", (__bridge NSString *)string1);
    
    NSString * result = [NSString stringWithFormat:@"%@e%d",(__bridge NSString *)string1,exponent];
    
    CFRelease(currentLocale);
    CFRelease(customCurrencyFormatter);
    CFRelease(number1);
    CFRelease(string1);
    
    
    
    NSString * dian = [self numberCodeDict][@"dian"];
    result = [result  stringByReplacingOccurrencesOfString:@"." withString:dian];
    
    return result;
    
}





-(NSDictionary *)numberCodeDict
{
    
    return [NSString numberCodeDict];
}
+(NSDictionary *)numberCodeDict
{
    NSString * code ;
    NSString * dian ;
    NSInteger type = [YSHDecimalTextField decimalType];
    if (type==0) {
        //        中文英文 通用型
        code = @",";
        dian = @".";
    }else {
        //        越南语
        code = @".";
        dian = @",";
    }
    return @{
             @"code":code,
             @"dian":dian,
             };
}

-(NSString *)decodeencodeDecimalChangeformat{
    
    NSString * code = [self numberCodeDict][@"code"];
    NSString * dian = [self numberCodeDict][@"dian"];
    NSString * balance = self;
    NSString * newStr= [balance stringByReplacingOccurrencesOfString:code withString:@""];
    newStr= [newStr stringByReplacingOccurrencesOfString:dian withString:@"."];
    return  newStr;
    
    
    
}



-(NSString *)textDecimalForamt{
    
    
    NSString * dian = [self numberCodeDict][@"dian"];
    NSString * balance = self;
    
    NSString * newStr= [balance stringByReplacingOccurrencesOfString:dian withString:@"."];
    newStr= [newStr stringByReplacingOccurrencesOfString:@".." withString:@"."];
    
    NSArray * tempArr = [newStr componentsSeparatedByString:@"."];
    
    NSString * xiaoShu ;
    NSString * num ;
    
    if (tempArr.count==2) {
        //        只有整数
        xiaoShu = tempArr.lastObject;
    }
    num = tempArr.firstObject;
    num = [NSString stringWithFormat:@"%lld",num.longLongValue];
    if (xiaoShu==nil) {
        newStr = [NSString stringWithFormat:@"%@",num];
    }else{
        //        if (xiaoShu.length>2) {
        //
        //            xiaoShu = [xiaoShu substringToIndex:2];
        //
        //        }
        //
        newStr = [NSString stringWithFormat:@"%@.%@",num,xiaoShu];
    }
    //    newStr = [NSString stringWithFormat:@"%.2f",[newStr doubleValue]];
    
    
    return  newStr;
    
    
    
}






@end
