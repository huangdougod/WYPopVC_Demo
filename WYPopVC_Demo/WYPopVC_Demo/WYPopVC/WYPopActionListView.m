//
//  WYPopActionListView.m
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "WYPopActionListView.h"
#import "WYPopActionView.h"
#define UIScreenWidth UIScreen.mainScreen.bounds.size.width
#define UIScreenHeight UIScreen.mainScreen.bounds.size.height
@interface WYPopActionListView ()<WYActionViewBtnDelegate>
@end
@implementation WYPopActionListView
+ (WYPopActionListView *)sharedInstance{
    static WYPopActionListView *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[WYPopActionListView alloc]init];
        
    });
    return shareInstance;
}
- (void)setUpUiWithArray:(NSMutableArray *)array{
    NSInteger modulesNum = array.count;
    CGFloat modulsH;
    if (modulesNum%3 == 0) {
        modulsH = ((modulesNum - modulesNum%3)/3)*81 +10;
    }else{
        modulsH = ((modulesNum - modulesNum%3)/3 +1)*81 +10;
    }
    [self addSubview:self.actionBgView];
    
    self.actionBgView.frame = CGRectMake(0, 0 , UIScreenWidth, modulsH+140+15+20);
    for (UIView *view in [self.actionBgView subviews]) {
        [view removeFromSuperview];
    }
    
    CGFloat acW = UIScreenWidth/3;
    for (int i = 0; i < array.count; i++) {
        WYPopActionView *acView = [[WYPopActionView alloc]initWithFrame:CGRectMake(i%3 * acW, ((i - i%3)/3)*91+15, acW, 91)];
        acView.delegate = self;
        [self.actionBgView addSubview:acView];
        acView.model = array[i];
    }
    
    [self.actionBgView addSubview:self.lastBtn];
    self.lastBtn.frame = CGRectMake((self.frame.size.width-100)/2, modulsH+30+15, 100, 20);
  
    [self.actionBgView addSubview:self.lineView];
    self.lineView.frame = CGRectMake((self.frame.size.width-80)/2, modulsH+30+15+20, 80, 1);
    
    [self.actionBgView addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake((self.frame.size.width-56)/2,self.actionBgView.frame.size.height -70, 56, 56);
}
- (void)pressToClose{
    self.block();
}
- (UIView *)actionBgView{
    if (!_actionBgView) {
        _actionBgView = [[UIView alloc]init];
        _actionBgView.backgroundColor = [UIColor whiteColor];
    }
    return _actionBgView;
}
- (UIButton *)lastBtn{
    if (!_lastBtn) {
        _lastBtn = [[UIButton alloc]init];
        [_lastBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _lastBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_lastBtn setTitle:@"这个不一样" forState:UIControlStateNormal];
        [_lastBtn addTarget:self action:@selector(pressToCustom) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lastBtn;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}
- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"seven"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(pressToClose) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (void)pressToClickWithModel:(WYPopListModel *)model{
    if (self.btnActionBlock) {
        self.btnActionBlock(model.title);
    }
}
//自定义通知
- (void)pressToCustom{
    if (self.btnActionBlock) {
        self.btnActionBlock(@"这个不一样");
    }
    
}


@end
