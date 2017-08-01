//
//  SUInforView.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUInforView.h"

@interface SUInforView ()

//图表
@property(nonatomic,weak)UIImageView *iconImg;
//折扣信息
@property(nonatomic,weak)UILabel *infoLabel;
@end

@implementation SUInforView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    //图表
    UIImageView *iconImg = [[UIImageView alloc] init];
    [self addSubview:iconImg];
    //约束
    [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.equalTo(iconImg.mas_height);
    }];
    _iconImg = iconImg;
    
    //折扣信息
    UILabel *infoLabel = [[UILabel alloc] init];
    [self addSubview:infoLabel];
    infoLabel.font = [UIFont systemFontOfSize:12];
    infoLabel.textColor = [UIColor whiteColor];
    //约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImg.mas_right).offset(8);
        make.centerY.offset(0);
    }];
    _infoLabel = infoLabel;
}
//重写set方法
-(void)setDiscData:(SUDiscoModel *)discData
{
    _discData = discData;
    //加载图标
    NSURL *url = [NSURL URLWithString:discData.icon_url];
    [_iconImg sd_setImageWithURL:url];
    //加载折扣信息
    _infoLabel.text = discData.info;
  
}
@end
