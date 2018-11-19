//
//  UIColor+Until.h
//  WYAlertView_Demo
//
//  Created by 黄豆大仙 on 2018/11/14.
//  Copyright © 2018年 WYAlertView. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Until)
    
/**
 从十六制字符串获取颜色

 @param color 略
 @return 略
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
    
/**
 从十六制字符串获取颜色

 @param color 略
 @param alpha 透明度
 @return 略
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
