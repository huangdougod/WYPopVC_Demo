//
//  HomeViewController.m
//  WYPopVC_Demo
//
//  Created by 黄豆大仙 on 2018/11/19.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "HomeViewController.h"
//#import "TestViewController.h"
#import "WYPopViewController.h"
#import "HomeTableViewCell.h"

#import "WYAlertView.h"
#import "WYPopListModel.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleMutArr;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}
- (void)setUpUI{
    [self.titleMutArr addObjectsFromArray:@[@"模态控制器类型",@"keyWindow添加view,一个按钮",@"keyWindow添加view,二个按钮"]];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"HomeTableViewCell"];
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTableViewCell"];
    }
    cell.title = self.titleMutArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        TestViewController *testVC = [[TestViewController alloc]init];
//        [self.navigationController pushViewController:testVC animated:YES];
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
    }else if (indexPath.row == 1){
        [WYAlertView showAlertViewWithTitle:@"单个按钮" message:@"单个按钮，添加一个view在keyWindow层" messageAlignment:WYAlertViewTextAlignmentCenter buttonTitle:@"我知道啦" buttonClickedBlock:^(NSInteger tag) {
            
        }];
    }else if (indexPath.row == 2){
        [WYAlertView showAlertViewWithTitle:@"两个按钮" message:@"两个按钮，添加一个view在keyWindow层，根据tag确定按钮，0左边，1右边" messageAlignment:WYAlertViewTextAlignmentCenter leftButtonTitle:@"取消" rightButtonTitle:@"确定" buttonClickedBlock:^(NSInteger tag) {
            if (tag == 0) {
                
            }else if (tag == 1){
                
            }
        }];
    }
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 50;
    }
    return _tableView;
}
- (NSMutableArray *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = [NSMutableArray new];
    }
    return _titleMutArr;
}
@end
