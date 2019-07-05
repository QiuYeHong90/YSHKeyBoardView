//
//  YSHNumberKeyBoard.m
//  JianPanDemo
//
//  Created by shuhui on 2019/4/12.
//  Copyright © 2019 cqdunyue. All rights reserved.
//

#import "NSBundle+YSHKeyBoardView.h"
#import <YYKit/YYKit.h>
#import "YSHNumberKeyBoard.h"
@interface YSHNumberKeyBoard ()<UIKeyInput>

@property (strong, nonatomic) IBOutlet UIView *keyboardView;
@property (strong, nonatomic)  UIButton *deleteBtn;
@property (strong, nonatomic)  UIButton *weiLing;
@property (strong, nonatomic)  UIButton *okButton;


@property (strong, nonatomic)  UIView * line;

@end
@implementation YSHNumberKeyBoard


-(NSArray *)numberArr
{
    NSInteger type = [YSHDecimalTextField decimalType];
    NSArray * numberArr = @[@"1",@"2",@"3",@"shouqi",@"4",@"5",@"6",@"C",@"7",@"8",@"9",@"OK",@".",@"0",@"back",@"OK"];
    if (type!=0) {
        numberArr = @[@"1",@"2",@"3",@"shouqi",@"4",@"5",@"6",@"C",@"7",@"8",@"9",@"OK",@",",@"0",@"back",@"OK"];
    }
    return numberArr;
}


- (id)initWithInputType:(RYInputType)inputType
{
    self = [super init];
    
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = CGRectMake(0, 0, SYS_DEVICE_WIDTH, 216+SYS_DEVICE_BottomSalfe_HEIGHT);
        self.inputType = inputType;
        
        [self setUpUI];
    }
    
    return self;
}


-(void)setUpUI
{
    
    UIView * line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:218/255.f green:218/255.f blue:218/255.f alpha:1];
    [self addSubview:line];
    self.line = line;
    
    NSArray * numberArr = [self numberArr];
    NSInteger tag = 0;
    NSInteger coll = 4 ;
    for (NSString * str in numberArr) {
        if ((tag/coll>2)&&(tag%coll==3)) {
            tag++;
            continue ;
        }

        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
        button.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        button.tag = 100+tag;
        [button setTitle:str forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(keyboardViewAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        if (tag==3) {
            [button setTitle:nil forState:UIControlStateNormal];
            [button setImage:[NSBundle YSHKeyBoardView:@"jianpan_shouqi"] forState:UIControlStateNormal];
        }
        if (tag==7) {
            self.weiLing = button;
            
        }
        if (tag==11) {
            self.okButton = button;
            
        }
        if (tag==14) {
            self.deleteBtn = button;
        }
        
        tag++;
        
        
        [self addSubview:button];
        
    }

    
    
}

-(void)setDeleteBtn:(UIButton *)deleteBtn
{
    _deleteBtn = deleteBtn ;
    [deleteBtn setTitle:nil forState:UIControlStateNormal];
    
    [deleteBtn setImage:[NSBundle YSHKeyBoardView:@"jianpan_shanchu"] forState:UIControlStateNormal];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    self.line.frame = CGRectMake(0, 0, SYS_DEVICE_WIDTH, 1);
    
    CGFloat space = 2;
    NSInteger coll = 4 ;
    NSInteger row = 4 ;
    CGFloat w = (SYS_DEVICE_WIDTH-space*(coll-1))/4.f;
    CGFloat h = 45 ;
    NSArray * numberArr = [self numberArr];
    
    for (NSInteger i = 0; i<numberArr.count; i++) {
        NSInteger rowIndex = i/coll ;
        NSInteger collIndex = i%coll ;
        if ((rowIndex>2)&&(collIndex==3)) {
            continue ;
        }
        
        UIButton * btn = [self viewWithTag:i+100];
        btn.frame = CGRectMake(collIndex*(w+space),1 +rowIndex*(h+space), w, h);
        if ((rowIndex==2)&&(collIndex==3)) {
            
            btn.frame = CGRectMake(collIndex*(w+space),1 +rowIndex*(h+space), w, h*2+space*1);
        }
        
        
    }
    
    
    
}


- (void)setInterval:(NSNumber *)interval
{
    _interval = interval;
}

- (void)setInputType:(RYInputType)inputType
{
    UIButton *xBtn = [self viewWithTag:1011];
    UIButton *dotBtn = [self viewWithTag:1010];
    
    _inputType = inputType;
    
    switch (inputType)
    {
            // 浮点数键盘
        case RYFloatInputType:
        {
            xBtn.hidden = YES;
            dotBtn.hidden = NO;
            break;
        }
            // 身份证键盘
        case RYIDCardInputType:
        {
            xBtn.hidden = NO;
            dotBtn.hidden = YES;
            break;
        }
            // 数字键盘
        default:
        {
            xBtn.hidden = YES;
            dotBtn.hidden = YES;
            break;
        }
    }
}

- (IBAction)keyboardViewAction:(UIButton *)sender
{
    
    
    
    NSInteger tag = sender.tag;
    
    switch (tag)
    {
        
            
        case 114:
        {
            // 删除
            if(self.textInput.text.length > 0)
                [self.textInput deleteBackward];
        }
            break;
        case 107:
        {
            // 清空
            [self.textInput clearWeiLing];
        }
            break;
        case 103:
        case 111:
        {
            // 确认
            [self.textInput resignFirstResponder];
            
        }
            break;
        default:
        {
            
            
            
            
            // 数字
            NSString *text = sender.titleLabel.text;
            BOOL isAllow  = [self.textInput textField:self.textInput replacementString:text];
            if (isAllow) {
                [self.textInput insertText:text];
                
            }
            
        }
            break;
    }
}

#pragma mark -
#pragma mark - Notification Action
//- (void)editingDidBegin:(NSNotification *)notification {
//    if (![notification.object conformsToProtocol:@protocol(UITextInput)])
//    {
//        self.textInput = nil;
//        return;
//    }
//    self.textInput = notification.object;
//}
//
//- (void)editingDidEnd:(NSNotification *)notification
//{
//    self.textInput = nil;
//}

#pragma mark -
#pragma mark - UIKeyInput Protocol


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
