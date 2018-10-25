//
//  TestViewController.m
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "TestViewController.h"
#import "WYPopViewController.h"
#import "WYPopListModel.h"
@interface TestViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUi];
}
- (void)setUpUi{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"控制器式弹窗";
    [self.view addSubview:self.btn];
    self.btn.center = self.view.center;
}
- (void)clickToPop{
    NSArray *imageArr = @[@"one",@"two",@"three",@"four",@"five",@"six"];
    NSArray *titleArr = @[@"action1",@"action2",@"action3",@"action4",@"action5",@"action5"];
    NSMutableArray *actionMutArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < imageArr.count; i++) {
        WYPopListModel *model = [[WYPopListModel alloc]init];
        model.imageName = imageArr[i];
        model.title = titleArr[i];
        [actionMutArr addObject:model];
    }
    //直接present到这个VC
     WYPopViewController *alertController = [[WYPopViewController alloc]init];
    //模态出一个半透明的控制器
    alertController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    alertController.actionMutArr = actionMutArr;
   
    [self presentViewController:alertController animated:NO completion:nil];
    alertController.popViewActionBlock = ^(NSString *str) {
        NSLog(@"%@",str);
    };
    
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        [_btn addTarget:self action:@selector(clickToPop) forControlEvents:UIControlEventTouchUpInside];
        [_btn setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    }
    return _btn;
}

@end
