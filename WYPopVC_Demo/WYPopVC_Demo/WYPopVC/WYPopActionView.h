//
//  WYPopActionView.h
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopListModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol WYActionViewBtnDelegate <NSObject>
- (void)pressToClickWithModel:(WYPopListModel *)model;
@end
@interface WYPopActionView : UIView
@property (nonatomic, strong) UIImageView *ActionImageV;
@property (nonatomic, strong) UILabel *ActionName;
@property (weak, nonatomic) id <WYActionViewBtnDelegate>delegate;
@property (nonatomic, strong) WYPopListModel *model;
@end

NS_ASSUME_NONNULL_END
