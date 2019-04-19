//
//  YSHViewController.m
//  YSHKeyBoardView
//
//  Created by 793983383@qq.com on 04/13/2019.
//  Copyright (c) 2019 793983383@qq.com. All rights reserved.
//

#import "YSHKeyBoardSingle.h"
#import "YSHViewController.h"

@interface YSHViewController ()

@end

@implementation YSHViewController
- (IBAction)btnClick:(id)sender {
    if ( [YSHKeyBoardSingle sharedInstance].type == 0){
        [YSHKeyBoardSingle sharedInstance].type = 1 ;
    }else{
        [YSHKeyBoardSingle sharedInstance].type = 0;
    }
    UIStoryboard * bd = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [bd instantiateViewControllerWithIdentifier:@"YSHViewController"];
    
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ( [YSHKeyBoardSingle sharedInstance].type == 0) {
        [self.button setTitle:@"国际通用" forState:UIControlStateNormal];
    }else{
        [self.button setTitle:@"其他" forState:UIControlStateNormal];
    }
    self.textView.placeholder = @"你好先生";
    self.textView.valueStr = @"";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
