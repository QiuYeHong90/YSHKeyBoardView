//
//  YSHKeyBoardSingle.m
//  Pods-YSHKeyBoardView_Example
//
//  Created by Mac on 2019/4/13.
//

#import "YSHKeyBoardSingle.h"

@implementation YSHKeyBoardSingle
+(id)allocWithZone:(NSZone *)zone{
    return [self.class sharedInstance];
}
+(YSHKeyBoardSingle *) sharedInstance{
    static YSHKeyBoardSingle * s_instance_dj_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance_dj_singleton = [[super allocWithZone:nil] init];
    });
    return s_instance_dj_singleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = 0 ;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    return [self.class sharedInstance];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    
    [ NSUserDefaults  standardUserDefaults];
    return [self.class sharedInstance];
}
@end
