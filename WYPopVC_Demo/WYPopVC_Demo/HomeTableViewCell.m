//
//  HomeTableViewCell.m
//  WYPopVC_Demo
//
//  Created by 黄豆大仙 on 2018/11/19.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    _titleLab = [[UILabel alloc]init];
    _titleLab.frame = CGRectMake(15, 0, self.contentView.frame.size.width, 40);
    _titleLab.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLab];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLab.text = title;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
