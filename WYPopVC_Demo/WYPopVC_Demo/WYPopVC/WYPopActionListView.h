//
//  WYPopActionListView.h
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^btnActionBlock)(NSString *actionName);
typedef void (^closeBlock)(void);
@interface WYPopActionListView : UIView
+(WYPopActionListView *)sharedInstance;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *actionBgView;
@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *closeBtn;
- (void)setUpUiWithArray:(NSMutableArray *)array;
@property (nonatomic, copy) closeBlock block;
@property (nonatomic, copy) btnActionBlock btnActionBlock;
@property (nonatomic, strong) UINavigationController *nav;
@end

NS_ASSUME_NONNULL_END
