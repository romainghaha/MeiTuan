//
//  SUShopDetailVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/2.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopDetailVC.h"
#import "SUShopModel.h"
#import "SUInforView.h"
#import "SUDiscoModel.h"

@interface SUScrollView : UIScrollView

@end
@implementation SUScrollView

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}


@end

@interface SUShopDetailVC ()

@end

@implementation SUShopDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    [self setUpUI];
    
    
}

//界面搭建
-(void)setUpUI
{
    //创建背景视图
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_shopDataModel.poi_back_pic_url stringByDeletingPathExtension]]];
    //bgImageView.userInteractionEnabled = YES;
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //设置关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    [self.view addSubview:closeBtn];
    
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //约束
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
    }];
    
    //创建滚动视图
    SUScrollView *discountScrollView = [[SUScrollView alloc] init];
    [self.view addSubview:discountScrollView];
    discountScrollView.showsHorizontalScrollIndicator = NO;
    discountScrollView.showsVerticalScrollIndicator = NO;
    //discountScrollView.backgroundColor = [UIColor grayColor];
    //约束
    [discountScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.equalTo(closeBtn.mas_top).offset(-60);
    }];
    //创建一个view用来装scrollView的所有子控件
    UIView *contentView = [[UIView alloc] init];
    [discountScrollView addSubview:contentView];
    //约束
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.equalTo(discountScrollView);
        //make.height.offset(1000);
    }];
    
    //店名
    UILabel *shopName = [[UILabel alloc] init];
    [contentView addSubview:shopName];
    shopName.textColor = [UIColor whiteColor];
    //约束
    [shopName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(60);
    }];
    //传入数据
    shopName.text = _shopDataModel.name;
    //起送价及配送
    UILabel *shopTipLabel = [[UILabel alloc] init];
    [contentView addSubview:shopTipLabel];
    shopTipLabel.textColor = [UIColor whiteColor];
    shopTipLabel.font = [UIFont systemFontOfSize:14];
    //约束
    [shopTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopName.mas_bottom).offset(10);
    }];
    //传入数据
    shopTipLabel.text = [NSString stringWithFormat:@"起送价:%@ | %@ | %@",_shopDataModel.min_price,_shopDataModel.shipping_fee_tip,_shopDataModel.delivery_time_tip];
    //折扣信息
    UILabel *discountLabel = [[UILabel alloc] init];
    [contentView addSubview:discountLabel];
    discountLabel.textColor = [UIColor whiteColor];
    //约束
    [discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopTipLabel.mas_bottom).offset(40);
    }];
    discountLabel.text = @"折扣信息";
    //左白线
    UIView *lineLeftView = [[UIView alloc] init];
    lineLeftView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:lineLeftView];
    //约束
    [lineLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.equalTo(discountLabel).offset(0);
        make.right.equalTo(discountLabel.mas_left).offset(-10);
        make.height.offset(1);
    }];
    //右白线
    UIView *lineRightView = [[UIView alloc] init];
    lineRightView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:lineRightView];
    //约束
    [lineRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.centerY.equalTo(discountLabel).offset(0);
        make.left.equalTo(discountLabel.mas_right).offset(10);
        make.height.offset(1);
    }];
    
    //优惠详情
    UIStackView *discountStackView = [[UIStackView alloc] init];
    //设置轴向
    discountStackView.axis = UILayoutConstraintAxisVertical;
    //设置分布,等分分布
    discountStackView.distribution = UIStackViewDistributionFillEqually;
    //设置分布间距
    discountStackView.spacing = 10;
    
    //根据优惠模型的个数遍历创建视图
    for(SUDiscoModel *dm in _shopDataModel.discoDataModel)
    {
        SUInforView *inf = [[SUInforView alloc] init];
        inf.discData = dm;
        [discountStackView addArrangedSubview:inf];
    }
    [contentView addSubview:discountStackView];
    //约束
    [discountStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.equalTo(discountLabel.mas_bottom).offset(10);
        make.height.offset(_shopDataModel.discoDataModel.count*30);
    }];
    
    
    
    
    //公告信息
    UILabel *bulletinLabel = [[UILabel alloc] init];
    [contentView addSubview:bulletinLabel];
    bulletinLabel.textColor = [UIColor whiteColor];
    //约束
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(discountStackView.mas_bottom).offset(40);
    }];
    bulletinLabel.text = @"公告信息";
    //左白线
    UIView *linebLeftView = [[UIView alloc] init];
    linebLeftView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:linebLeftView];
    //约束
    [linebLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.equalTo(bulletinLabel).offset(0);
        make.right.equalTo(bulletinLabel.mas_left).offset(-10);
        make.height.offset(1);
    }];
    //右白线
    UIView *linebRightView = [[UIView alloc] init];
    linebRightView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:linebRightView];
    //约束
    [linebRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.centerY.equalTo(bulletinLabel).offset(0);
        make.left.equalTo(bulletinLabel.mas_right).offset(10);
        make.height.offset(1);
    }];

    //公告内容
    UILabel *bulletinLabelInf = [[UILabel alloc] init];
    [contentView addSubview:bulletinLabelInf];
    bulletinLabelInf.textColor = [UIColor whiteColor];
    bulletinLabelInf.font = [UIFont systemFontOfSize:12];
    bulletinLabelInf.numberOfLines = 0;
    //约束
    [bulletinLabelInf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bulletinLabel.mas_bottom).offset(10);
        make.bottom.offset(-60);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    //传值
    bulletinLabelInf.text = _shopDataModel.bulletin;
    
    
    
}
//关闭商店详细按钮
-(void)closeBtnClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
