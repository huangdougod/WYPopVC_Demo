//
//  WYPopActionView.m
//  WYPopVCdemo
//
//  Created by 黄豆大仙 on 2018/10/25.
//  Copyright © 2018年 dkt网络有限公司. All rights reserved.
//

#import "WYPopActionView.h"

@implementation WYPopActionView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUi];
    }
    return self;
}
- (void)setUpUi{
    [self addSubview:self.ActionImageV];
    [self addSubview:self.ActionName];
    
    self.ActionImageV.frame = CGRectMake((self.frame.size.width - 44)/2, 15, 44, 44);
    self.ActionName.frame = CGRectMake(0, 78, self.frame.size.width, 20);
    UIButton *clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    clearBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:clearBtn];
    [clearBtn addTarget:self action:@selector(ClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)ClickAction:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pressToClickWithModel:)]) {
        [self.delegate pressToClickWithModel:self.model];
    }
}
- (void)setModel:(WYPopListModel *)model{
    _model = model;
    self.ActionImageV.image = [UIImage imageNamed:self.model.imageName];
    self.ActionName.text = self.model.title;
}

- (UIImageView *)ActionImageV{
    if (!_ActionImageV) {
        _ActionImageV = [[UIImageView alloc]init];
        _ActionImageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _ActionImageV;
}
- (UILabel *)ActionName{
    if (!_ActionName) {
        _ActionName = [[UILabel alloc]init];
        _ActionName.textColor = [UIColor blackColor];
        _ActionName.font = [UIFont systemFontOfSize:14];
        _ActionName.textAlignment = NSTextAlignmentCenter;
    }
    return _ActionName;
}
@end
