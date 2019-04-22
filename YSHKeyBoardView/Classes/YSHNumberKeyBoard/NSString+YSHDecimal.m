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
        if (xiaoShu.length>2) {
           
            xiaoShu = [xiaoShu substringToIndex:2];
           
        }
        
        newStr = [NSString stringWithFormat:@"%@.%@",num,xiaoShu];
    }
//    newStr = [NSString stringWithFormat:@"%.2f",[newStr doubleValue]];
    
    
    return  newStr;
    
    
    
}






@end
