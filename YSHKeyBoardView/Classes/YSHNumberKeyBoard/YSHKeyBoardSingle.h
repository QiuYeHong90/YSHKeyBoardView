//
//  YSHKeyBoardSingle.h
//  Pods-YSHKeyBoardView_Example
//
//  Created by Mac on 2019/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSHKeyBoardSingle : NSObject

+(YSHKeyBoardSingle *) sharedInstance;

/**
 0 国际普通金额数字展示 1,222,333.00 1 其他国际数字展示 1.222.333,00
 */
@property (nonatomic,assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
