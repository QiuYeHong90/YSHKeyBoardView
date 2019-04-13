//
//  NSString+YSHDecimal.h
//  JianPanNum
//
//  Created by shuhui on 2019/4/10.
//  Copyright © 2019 cqdunyue. All rights reserved.
//
#import "YSHDecimalTextField.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YSHDecimal)
/**
 此为小数时候支持
 */
-(NSString *)encodeDecimalChangeformat;

/**
 转换
 */
-(NSString *)decodeencodeDecimalChangeformat;

+(NSDictionary *)numberCodeDict;

-(NSString *)textDecimalForamt;
@end

NS_ASSUME_NONNULL_END
