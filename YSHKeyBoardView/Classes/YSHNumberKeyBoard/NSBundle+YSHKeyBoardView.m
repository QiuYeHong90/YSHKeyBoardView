//
//  NSBundle+YSHKeyBoardView.m
//  Pods-YSHKeyBoardView_Example
//
//  Created by Mac on 2019/4/13.
//

#import <YYKit/YYKit.h>
#import "YSHDecmialTextFieldView.h"
#import "NSBundle+YSHKeyBoardView.h"

@implementation NSBundle (YSHKeyBoardView)
+ (instancetype)ysh_YSHKeyBoardViewBundle
{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        NSBundle *bundle = [NSBundle bundleForClass:[YSHDecmialTextFieldView class]];
        NSURL *url = [bundle URLForResource:@"YSHKeyBoardView" withExtension:@"bundle"];
        bundle = [NSBundle bundleWithURL:url];
        refreshBundle = bundle;
    }
    return refreshBundle;
}


+ (UIImage *)YSHKeyBoardView:(NSString *)name
{
    NSString * path  = [[self ysh_YSHKeyBoardViewBundle] pathForScaledResource:name ofType:@"png"];
    
    UIImage *arrowImage = nil;
    if (arrowImage == nil) {
        arrowImage =  [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
    }
    return arrowImage;
}
@end
