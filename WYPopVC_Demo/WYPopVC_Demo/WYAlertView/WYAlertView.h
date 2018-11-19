//
//  WYAlertView.h
//  WYAlertView_Demo
//
//  Created by 黄豆大仙 on 2018/11/14.
//  Copyright © 2018年 WYAlertView. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,WYAlertViewTextAlignment) {
    WYAlertViewTextAlignmentLeft,
    WYAlertViewTextAlignmentCenter,
    WYAlertViewTextAlignmentRight,
};
@interface WYAlertView : UIView

/**
 自定义弹窗（底部两个按钮的那种）

 @param title 标题
 @param message 内容
 @param WYAlertViewTextAlignment 内容对齐方式
 @param leftTitle 左边按钮标题
 @param rightTitle 右边按钮标题
 @param alertViewBtnClickedBlock 点击事件对应block，左边tag为0，右边为1
 */
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message messageAlignment:(NSInteger)WYAlertViewTextAlignment leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rightTitle buttonClickedBlock:(void(^)(NSInteger tag))alertViewBtnClickedBlock;

/**
 自定义弹窗（底部一个按钮）

 @param title 标题
 @param message 内容
 @param WYAlertViewTextAlignment 内容对齐方式
 @param buttonTitle 底部按钮标题
 @param alertViewBtnClickedBlock 点击事件block
 */
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message messageAlignment:(NSInteger)WYAlertViewTextAlignment buttonTitle:(NSString *)buttonTitle buttonClickedBlock:(void(^)(NSInteger tag)) alertViewBtnClickedBlock;
@end

NS_ASSUME_NONNULL_END
