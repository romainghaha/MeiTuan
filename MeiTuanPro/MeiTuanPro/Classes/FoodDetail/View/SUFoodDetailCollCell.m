//
//  SUFoodDetailCollCell.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/4.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodDetailCollCell.h"
#import "SUFoodDetailModel.h"
@interface SUFoodDetailCollCell ()<UIScrollViewDelegate>
//图片
@property(nonatomic,weak)UIImageView *foodImage;
//商品名
@property(nonatomic,weak)UILabel *foodNameLabel;
//月售
@property(nonatomic,weak)UILabel *monthSale;
//售价
@property(nonatomic,weak)UILabel *salePrice;
//内容
@property(nonatomic,weak)UILabel *shopContent;
//好评率
@property(nonatomic,weak)UILabel *praiseLabel;
//进度条
@property(nonatomic,weak)UIProgressView *progressView;

@end

@implementation SUFoodDetailCollCell

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
    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    //scrollView.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:scrollView];
    scrollView.bounces = YES;
    //代理
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
    //约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //创建view把所有子控件添加到view,应为,滚动视图的所有直接子控件必须要指定明确的宽和高
    UIView *mainView = [[UIView alloc] init];
    //mainView.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:mainView];
    //约束
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset([UIScreen mainScreen].bounds.size.width);
        make.height.offset(1000);
    }];
    //产品图片
    UIImageView *foodImage = [[UIImageView alloc] init];
    [mainView addSubview:foodImage];
    [foodImage sd_setImageWithURL:[NSURL URLWithString:@"http://p1.meituan.net/xianfu/d36a62f1130c63ffa5a61c9cfd2be9f0212992.jpg"]];
    //约束
    [foodImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(300);
    }];
    //品名
    UILabel *foodNameLabel = [[UILabel alloc] init];
    [mainView addSubview:foodNameLabel];
    foodNameLabel.text = @"逼良为娼的坏蛋";
    //约束
    [foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foodImage.mas_bottom).offset(8);
        make.left.offset(8);
    }];
    //月售
    UILabel *monthSale = [[UILabel alloc] init];
    [mainView addSubview:monthSale];
    monthSale.text = @"月售998";
    monthSale.textColor = [UIColor darkGrayColor];
    monthSale.font = [UIFont systemFontOfSize:14];
    [monthSale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.top.equalTo(foodNameLabel.mas_bottom).offset(8);
    }];
    //售价
    UILabel *salePrice = [[UILabel alloc] init];
    [mainView addSubview:salePrice];
    salePrice.text = @"¥59";
    salePrice.textColor = [UIColor orangeColor];
    salePrice.font = [UIFont systemFontOfSize:20];
    [salePrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monthSale.mas_bottom).offset(20);
        make.left.offset(8);
    }];
    //商品信息
    UILabel *shopInfor = [[UILabel alloc] init];
    [mainView addSubview:shopInfor];
    shopInfor.text = @"商品信息";
    shopInfor.textColor = [UIColor darkGrayColor];
    shopInfor.font = [UIFont systemFontOfSize:14];
    //约束
    [shopInfor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(salePrice.mas_bottom).offset(20);
        make.left.offset(8);
    }];
    
    //商品信息内容
    UILabel *shopContent = [[UILabel alloc] init];
    [mainView addSubview:shopContent];
    shopContent.text = @"新鲜鸡蛋,面粉,酱油,新鲜鸡蛋,面粉,酱油新鲜鸡蛋,面粉,酱油新鲜鸡蛋,面粉,酱油新鲜鸡蛋,面粉,酱油新鲜鸡蛋,面粉,酱油";
    shopContent.textColor = [UIColor darkGrayColor];
    shopContent.font = [UIFont systemFontOfSize:14];
    shopContent.numberOfLines = 0;
    //约束
    [shopContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shopInfor.mas_bottom).offset(8);
        make.left.offset(8);
        make.right.offset(-8);
    }];
    
    //商品评价
    UILabel *shopJudge = [[UILabel alloc] init];
    [mainView addSubview:shopJudge];
    shopJudge.text = @"商品评价";
    shopJudge.textColor = [UIColor darkGrayColor];
    shopJudge.font = [UIFont systemFontOfSize:14];
    //约束
    [shopJudge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shopContent.mas_bottom).offset(8);
        make.left.offset(8);
    }];
    //商品好评度
    UIView *praiseView = [[UIView alloc] init];
    [mainView addSubview:praiseView];
    [praiseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopJudge.mas_bottom).offset(8);
        make.width.offset(85);
    }];
    //好评度label
    UILabel *praLabel = [[UILabel alloc] init];
    [praiseView addSubview:praLabel];
    praLabel.textColor = [UIColor orangeColor];
    praLabel.text = @"好评度";
    praLabel.textAlignment = NSTextAlignmentCenter;
    praLabel.font = [UIFont systemFontOfSize:16];
    //约束
    [praLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.centerY.offset(0);
    }];
    //好评率
    UILabel *praiseLabel = [[UILabel alloc] init];
    [praiseView addSubview:praiseLabel];
    praiseLabel.text = @"95%";
    praiseLabel.textColor = [UIColor orangeColor];
    praiseLabel.textAlignment = NSTextAlignmentCenter;
    praiseLabel.font = [UIFont systemFontOfSize:16];
    //约束
    [praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.centerY.offset(0);
    }];
    
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [mainView addSubview:progressView];
    progressView.progressTintColor = [UIColor orangeColor];
    progressView.progress = 0.5;
    progressView.layer.cornerRadius = 5;
    progressView.layer.masksToBounds = YES;
    //约束
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(praiseView.mas_bottom).offset(8);
        make.left.offset(8);
        make.right.offset(-8);
        make.height.offset(10);
    }];

    _foodImage = foodImage;
    _foodNameLabel = foodNameLabel;
    _monthSale = monthSale;
    _salePrice = salePrice;
    _shopContent = shopContent;
    _praiseLabel = praiseLabel;
    _progressView = progressView;
}

//重写set方法
-(void)setFoodDetailData:(SUFoodDetailModel *)foodDetailData
{
    _foodDetailData = foodDetailData;
    //赋值
    _foodNameLabel.text = foodDetailData.name;
    _monthSale.text = foodDetailData.month_saled_content;
    _salePrice.text = [NSString stringWithFormat:@"¥%@",@(foodDetailData.min_price).description];
    _shopContent.text = foodDetailData.desc;
    
    float num = 0;
    if(foodDetailData.praise_num)
    {
        num = (foodDetailData.praise_num/(foodDetailData.tread_num + foodDetailData.praise_num));
    }
    
    _praiseLabel.text = [NSString stringWithFormat:@"%.f%%",100*num];
    //(foodDetailData.praise_num/(foodDetailData.tread_num + foodDetailData.praise_num));
    [_foodImage sd_setImageWithURL:[NSURL URLWithString:[foodDetailData.picture stringByDeletingPathExtension]]];
    _progressView.progress = num;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取垂直滚动的距离
    CGFloat y = scrollView.contentOffset.y;
    //只有下拉时才会方法
    if(y < 0)
    {
        CGFloat scale = [self linearFunctionWith:y andConsulttOne:CGPointMake(0, 1) andConsultTwo:CGPointMake(-300, 2)];
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform  = CGAffineTransformTranslate(transform, 0, y*0.5);
        transform = CGAffineTransformScale(transform, scale, scale);
        _foodImage.transform = transform;
    }else
    {
        _foodImage.transform = CGAffineTransformIdentity;
    }
    
}

@end
