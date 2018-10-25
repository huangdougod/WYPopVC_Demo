//
//  WYPopViewController.h
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopActionListView.h"
#import "WYPopListModel.h"
typedef void (^popViewActionBlock)(NSString *str);
NS_ASSUME_NONNULL_BEGIN
@interface WYPopViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *actionMutArr;
@property (nonatomic, strong) WYPopActionListView *pushListView;
@property (nonatomic, copy) popViewActionBlock popViewActionBlock;
@end

NS_ASSUME_NONNULL_END
