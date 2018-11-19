//
//  WYAlertView.m
//  WYAlertView_Demo
//
//  Created by 黄豆大仙 on 2018/11/14.
//  Copyright © 2018年 WYAlertView. All rights reserved.
//

#import "WYAlertView.h"
#import "UIColor+Until.h"
#import <Masonry.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#define UIScreenWidth    [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight   [UIScreen mainScreen].bounds.size.height
@implementation WYAlertView
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message messageAlignment:(NSInteger)WYAlertViewTextAlignment leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle buttonClickedBlock:(void(^)(NSInteger tag))alertViewBtnClickedBlock{
    UIView *bgView = [[UIView alloc]init];
    [[[[UIApplication sharedApplication] delegate]window]addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    bgView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        bgView.alpha = 1;
    }];
    
    //白色View
    UIView *whiteView = [[UIView alloc]init];
    [bgView addSubview:whiteView];
    whiteView.clipsToBounds = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 8;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(UIScreenWidth - 100);
        make.center.mas_equalTo(bgView);
    }];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    [whiteView addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
    make.left.mas_equalTo(whiteView.mas_left).mas_offset(15);
    make.right.mas_equalTo(whiteView.mas_right).mas_offset(-15);
    }];
   
    //message
    UILabel *messageLabel = [[UILabel alloc]init];
    [whiteView addSubview:messageLabel];
    messageLabel.text = message;
    messageLabel.numberOfLines = 0;
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.textColor = [UIColor colorWithHexString:@"#292421"];
    //messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    switch (WYAlertViewTextAlignment) {
        case WYAlertViewTextAlignmentLeft:{
            messageLabel.textAlignment = NSTextAlignmentLeft;
        }
            
            break;
        case WYAlertViewTextAlignmentCenter:{
            messageLabel.textAlignment = NSTextAlignmentCenter;
        }
            
            break;
        case WYAlertViewTextAlignmentRight:{
            messageLabel.textAlignment = NSTextAlignmentRight;
        }
            
            break;
            
        default:
            break;
    }
    
  
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(5); make.left.mas_equalTo(whiteView.mas_left).mas_offset(15);
      make.right.mas_equalTo(whiteView.mas_right).mas_offset(-15);
    }];
    
    UIButton *leftButton = [[UIButton alloc]init];
    [whiteView addSubview:leftButton];
    [leftButton setTitle:leftTitle forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#0E75FF"] forState:UIControlStateNormal];//#0E75FF
    [leftButton .titleLabel setFont:[UIFont systemFontOfSize:17]];
    [[leftButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //点击取消按钮移除弹窗
        [bgView removeFromSuperview];
        alertViewBtnClickedBlock(0);
    }];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(whiteView);
    make.top.mas_equalTo(messageLabel.mas_bottom).mas_equalTo(15);
        make.right.mas_equalTo(whiteView.mas_centerX);
        make.height.mas_equalTo(43);
    }];
    
    //确认按钮
    UIButton *rightButton = [[UIButton alloc]init];
    [whiteView addSubview:rightButton];
    [rightButton setTitle:rightTitle forState:UIControlStateNormal];
    [rightButton .titleLabel setFont:[UIFont systemFontOfSize:17]];
    [rightButton setTitleColor:[UIColor colorWithHexString:@"#0E75FF"] forState:UIControlStateNormal];
    [[rightButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [bgView removeFromSuperview];
        alertViewBtnClickedBlock(1);
    }];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.mas_equalTo(leftButton);
        make.left.mas_equalTo(leftButton.mas_right);
        make.bottom.mas_equalTo(whiteView);
    }];
    //横灰线
    UIView *grayLineView1 = [[UIView alloc]init];
    [whiteView addSubview:grayLineView1];
    grayLineView1.backgroundColor = [UIColor colorWithHexString:@"#9FA2A4"];
    [grayLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(.5f);
        make.top.mas_equalTo(messageLabel.mas_bottom).mas_offset(15);
    }];
    
    //竖向灰线
    UIView *grayLineView2 = [[UIView alloc]init];
    [whiteView addSubview:grayLineView2];
    grayLineView2.backgroundColor = [UIColor colorWithHexString:@"#9FA2A4"];
    [grayLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(grayLineView1.mas_bottom);
        make.bottom.mas_equalTo(whiteView);
        make.centerX.mas_equalTo(whiteView);
        make.width.mas_equalTo(.5f);
    }];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message messageAlignment:(NSInteger)WYAlertViewTextAlignment buttonTitle:(NSString *)buttonTitle buttonClickedBlock:(void (^)(NSInteger))alertViewBtnClickedBlock{
    UIView *bgView = [[UIView alloc]init];
    [[[[UIApplication sharedApplication] delegate]window]addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    bgView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        bgView.alpha = 1;
    }];
    
    //白色View
    UIView *whiteView = [[UIView alloc]init];
    [bgView addSubview:whiteView];
    whiteView.clipsToBounds = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 8;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(UIScreenWidth - 100);
        make.center.mas_equalTo(bgView);
    }];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    [whiteView addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.left.mas_equalTo(whiteView.mas_left).mas_offset(15);
        make.right.mas_equalTo(whiteView.mas_right).mas_offset(-15);
    }];
    
    //message
    UILabel *messageLabel = [[UILabel alloc]init];
    [whiteView addSubview:messageLabel];
    messageLabel.text = message;
    messageLabel.numberOfLines = 0;
   // messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    
    switch (WYAlertViewTextAlignment) {
        case WYAlertViewTextAlignmentLeft:{
            messageLabel.textAlignment = NSTextAlignmentLeft;
        }
            
            break;
        case WYAlertViewTextAlignmentCenter:{
            messageLabel.textAlignment = NSTextAlignmentCenter;
        }
            
            break;
        case WYAlertViewTextAlignmentRight:{
            messageLabel.textAlignment = NSTextAlignmentRight;
        }
            
            break;
            
        default:
            break;
    }
    
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.textColor = [UIColor colorWithHexString:@"#292421"];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(5); make.left.mas_equalTo(whiteView.mas_left).mas_offset(15);
        make.right.mas_equalTo(whiteView.mas_right).mas_offset(-15);
    }];
    
    UIButton *bottomButton = [[UIButton alloc]init];
    [whiteView addSubview:bottomButton];
    //bottomButton.showsTouchWhenHighlighted = YES;
    [bottomButton setTitle:buttonTitle forState:UIControlStateNormal];
    [bottomButton setTitleColor:[UIColor colorWithHexString:@"#0E75FF"] forState:UIControlStateNormal];      
    [bottomButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [[bottomButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //点击取消按钮移除弹窗
        [bgView removeFromSuperview];
        alertViewBtnClickedBlock(0);
    }];
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(whiteView);
        make.right.mas_equalTo(whiteView);
    make.top.mas_equalTo(messageLabel.mas_bottom).mas_equalTo(15);
      
        make.height.mas_equalTo(43);
        make.bottom.mas_equalTo(whiteView);
    }];
    
   
    //横灰线
    UIView *grayLineView1 = [[UIView alloc]init];
    [whiteView addSubview:grayLineView1];
    grayLineView1.backgroundColor = [UIColor colorWithHexString:@"#9FA2A4"];
    [grayLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(.5f);
        make.top.mas_equalTo(messageLabel.mas_bottom).mas_offset(15);
    }];
}

@end
