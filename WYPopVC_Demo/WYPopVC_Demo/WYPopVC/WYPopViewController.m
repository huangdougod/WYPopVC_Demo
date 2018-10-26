//
//  WYPopViewController.m
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "WYPopViewController.h"

#define UIScreenWidth UIScreen.mainScreen.bounds.size.width
#define UIScreenHeight UIScreen.mainScreen.bounds.size.height
@interface WYPopViewController ()<UIGestureRecognizerDelegate>

@end

@implementation WYPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    [self setUpUi];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setUpAnimation];
}

- (void)setUpUi{
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.2];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickToClose)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
}
- (void)setUpAnimation{
    self.pushListView = [WYPopActionListView sharedInstance];
    NSInteger modulesNum = self.actionMutArr.count;
    CGFloat modulsH;
    if (modulesNum%3 == 0) {
        modulsH = ((modulesNum - modulesNum%3)/3)*81 +10;
    }else{
        modulsH = ((modulesNum - modulesNum%3)/3 +1)*81 +10;
    }
    self.pushListView.frame = CGRectMake(0, UIScreenHeight, UIScreenWidth, modulsH+140+15+20);
    [self.pushListView setUpUiWithArray:self.actionMutArr];
    [self.view addSubview:self.pushListView];
    __weak typeof(self) weakSelf = self;
    self.pushListView.block = ^{
        [weakSelf clickToColseWithBtn];
    };
    self.pushListView.btnActionBlock = ^(NSString * _Nonnull actionName) {
        weakSelf.popViewActionBlock(actionName);
    };
    [UIView animateWithDuration:0.35 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.pushListView setFrame:CGRectMake(0, UIScreenHeight -modulsH -140-15-20, UIScreenWidth, modulsH +140-15-20)];
        
    }];
    
}
#pragma mark ----private method
- (void)clickToColseWithBtn{
    [self clickToClose];
}
- (void)clickToClose{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.35 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.pushListView setFrame:CGRectMake(0, UIScreenHeight,UIScreenWidth, 0)];
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
    }];
}
#pragma mark ----UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch{
    if ([touch.view isDescendantOfView:self.pushListView]) {
        return NO;
    }
    return YES;
}
- (void)dealloc{
    NSLog(@"销毁了");
}

@end
