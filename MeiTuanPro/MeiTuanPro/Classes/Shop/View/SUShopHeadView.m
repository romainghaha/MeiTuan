//
//  SUShopHeadView.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopHeadView.h"
#import "SULoopView.h"
#import "SUShopDetailVC.h"
@interface SUShopHeadView ()
//背景图片
@property(nonatomic,weak)UIImageView *bgImageView;
//头像
@property(nonatomic,weak)UIImageView *avatarView;
//店名
@property(nonatomic,weak)UILabel *nameLabel;
//公告
@property(nonatomic,weak)UILabel *bulletinLabel;
//滚动视图
@property(nonatomic,weak)SULoopView *loopView;
@end

@implementation SUShopHeadView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return  self;
}
-(void)setUpUI
{
    //背景图片
    UIImageView *bgimgView = [[UIImageView alloc] init];
    [self addSubview:bgimgView];
    //填充模式
    bgimgView.contentMode = UIViewContentModeScaleAspectFill;
    //约束
    [bgimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //滚动广告
    SULoopView *loopView = [[SULoopView alloc] init];
    [self addSubview:loopView];
    //把超出边界的裁掉
    loopView.clipsToBounds = YES;
    //约束
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-8);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(20);
    }];
    //添加小箭头
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    [loopView addSubview:arrow];
    //约束
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.offset(0);
    }];
    
    //虚线
    UIView *dashLineView = [[UIView alloc] init];
    //创建背景填充
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage makeDashLineWithColor:[UIColor whiteColor]]];
    [self addSubview:dashLineView];
    //约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView.mas_left).offset(0);
        make.right.offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    //头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.backgroundColor = [UIColor orangeColor];
    [self addSubview:avatarView];
    //切圆角
    avatarView.layer.cornerRadius = 32;
    avatarView.layer.masksToBounds = YES; //avatarView.clipsToBounds = YES;
    //描边
    avatarView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    //边框宽
    avatarView.layer.borderWidth = 2;
    //填充模式
    avatarView.contentMode = UIViewContentModeScaleAspectFit;
    //约束
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dashLineView.mas_left).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.height.width.offset(64);
    }];
    //商店公告
    UILabel *bulletinLabel = [[UILabel alloc] init];
    [self addSubview:bulletinLabel];
    bulletinLabel.text = @"两只黄鹂鸣翠丽,一行白鹭上青天";
    bulletinLabel.font = [UIFont systemFontOfSize:14];
    bulletinLabel.textColor = [UIColor whiteColor];
    //约束
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(avatarView.mas_right).offset(16);
        make.centerY.equalTo(avatarView.mas_centerY).offset(16);
        
    }];
    //店名
    UILabel *namelabel = [[UILabel alloc] init];
    [self addSubview:namelabel];
    namelabel.text = @"醉仙楼";
    namelabel.textColor = [UIColor whiteColor];
    namelabel.font = [UIFont systemFontOfSize:18];
    //约束
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatarView.mas_right).offset(16);
        make.centerY.equalTo(avatarView.mas_centerY).offset(-16);
    }];
    
    
    //赋值
    _avatarView = avatarView;
    _bulletinLabel = bulletinLabel;
    _nameLabel = namelabel;
    _bgImageView = bgimgView;
    _loopView = loopView;
    
    
    //给滚动视图添加轻敲手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopViewClick)];
    //添加到loopView上
    [loopView addGestureRecognizer:tap];
    
    
    
}

-(void)loopViewClick
{
    //获取响应控制器
    UIViewController *vc = [self viewController];
    //创建转场控制器
    SUShopDetailVC *shopDetailVC = [[SUShopDetailVC alloc] init];
    //传入数据
    shopDetailVC.shopDataModel = _shopDataModel;
    //设置转场方式
    shopDetailVC.modalPresentationStyle = UIModalPresentationCustom;
    
    
    //转场
    [vc presentViewController:shopDetailVC animated:YES completion:^{
        
    }];
}

-(void)setShopDataModel:(SUShopModel *)shopDataModel
{
    _shopDataModel = shopDataModel;
    
    //背景图片
    NSString *bgStr = [shopDataModel.poi_back_pic_url stringByDeletingPathExtension];
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:bgStr]];
    //头像
    NSString *picStr = [shopDataModel.pic_url stringByDeletingPathExtension];
    [_avatarView sd_setImageWithURL:[NSURL URLWithString:picStr]];
    //店名
    _nameLabel.text = shopDataModel.name;
    //公告
    _bulletinLabel.text = shopDataModel.bulletin;
    //轮播
    _loopView.dicModelData = shopDataModel.discoDataModel;
}

@end
