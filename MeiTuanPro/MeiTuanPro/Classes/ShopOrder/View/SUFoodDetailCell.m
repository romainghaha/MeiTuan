//
//  SUFoodDetailCell.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodDetailCell.h"
#import "SUFoodDetailModel.h"
@interface SUFoodDetailCell ()
//图片
@property(nonatomic,weak)UIImageView *imgView;
//品名
@property(nonatomic,weak)UILabel *foodNameLabel;
//商品信息
@property(nonatomic,weak)UILabel *foodInforLabel;
//月销售
@property(nonatomic,weak)UILabel *monthSaleLabel;
//好评
@property(nonatomic,weak)UILabel *praiseLabel;
//单价
@property(nonatomic,weak)UILabel *priceLabel;
//添加按钮
@property(nonatomic,weak)UIButton *addBtn;
//减少按钮
@property(nonatomic,weak)UIButton *reduceBtn;
//点餐数量
@property(nonatomic,weak)UILabel *numLabel;


@end

@implementation SUFoodDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setUpUI];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    //图片
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_food_loading"]];
    [self.contentView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    //约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.offset(64);
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(8);
    }];
    //品名
    UILabel *foodNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:foodNameLabel];
    foodNameLabel.text = @"萝卜丝";
    //约束
    [foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(imageView.mas_right).offset(8);
        
    }];
    //信息
    UILabel *foodInforLabel = [[UILabel alloc] init];
    [self.contentView addSubview:foodInforLabel];
    foodInforLabel.text = @"萝卜青菜各有所爱,你不吃请走开萝卜青菜各有所爱,你不吃请走开萝卜青菜各有所爱,你不吃请走开";
    foodInforLabel.textColor = [UIColor darkGrayColor];
    foodInforLabel.font = [UIFont systemFontOfSize:12];
    foodInforLabel.numberOfLines = 2;
    //约束
    [foodInforLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foodNameLabel.mas_bottom).offset(2);
        make.left.equalTo(imageView.mas_right).offset(8);
        make.right.equalTo(self.contentView.mas_right).offset(-8);
    }];
    //月售
    UILabel *monthSaleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:monthSaleLabel];
    monthSaleLabel.text = @"月售:998";
    monthSaleLabel.textColor = [UIColor darkGrayColor];
    monthSaleLabel.font = [UIFont systemFontOfSize:12];
    //约束
    [monthSaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foodInforLabel.mas_bottom).offset(8);
        make.left.equalTo(imageView.mas_right).offset(8);
    }];
    //赞
    UILabel *praiseLabel = [[UILabel alloc] init];
    [self.contentView addSubview:praiseLabel];
    praiseLabel.text = @"赞998";
    praiseLabel.textColor = [UIColor darkGrayColor];
    praiseLabel.font = [UIFont systemFontOfSize:12];
    //约束
    [praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foodInforLabel.mas_bottom).offset(8);
        make.left.equalTo(monthSaleLabel.mas_right).offset(2);
    }];
    //售价
    UILabel *priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:priceLabel];
    priceLabel.text = @"赞998";
    priceLabel.textColor = [UIColor orangeColor];
    priceLabel.font = [UIFont systemFontOfSize:18];
    //约束
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(praiseLabel.mas_bottom).offset(18);
        make.left.equalTo(imageView.mas_right).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    
    //点餐模块
    UIView *addView = [[UIView alloc] init];
    //addView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:addView];
    //约束
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.height.offset(27);
        make.width.offset(90);
    }];
    //添加按钮
    UIButton *addBtn = [[UIButton alloc] init];
    [addView addSubview:addBtn];
    [addBtn setImage:[UIImage imageNamed:@"icon_food_increase"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //约束
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.offset(0);
    }];
    //减少按钮
    UIButton *reduceBtn = [[UIButton alloc] init];
    [addView addSubview:reduceBtn];
    [reduceBtn setImage:[UIImage imageNamed:@"icon_food_decrease"] forState:UIControlStateNormal];
    [reduceBtn addTarget:self action:@selector(reduceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //reduceBtn.hidden = YES;
    //约束
    [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
    }];
    //点餐数量
    UILabel *numLabel = [[UILabel alloc] init];
    [addView addSubview:numLabel];
    //numLabel.hidden = YES;
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.textColor = [UIColor orangeColor];
    //约束
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(addView).offset(0);
        make.centerY.equalTo(addView).offset(0);
    }];
    //
    _imgView = imageView;
    _foodNameLabel = foodNameLabel;
    _foodInforLabel = foodInforLabel;
    _praiseLabel = praiseLabel;
    _priceLabel = priceLabel;
    _monthSaleLabel = monthSaleLabel;
    _addBtn = addBtn;
    _reduceBtn = reduceBtn;
    _numLabel = numLabel;
 
}
-(void)addBtnClick
{
    _reduceBtn.hidden = NO;
    _numLabel.hidden = NO;
    (_foodDetailData.orderNum)++;
    _numLabel.text = @(_foodDetailData.orderNum).description;
}
-(void)reduceBtnClick
{
    if((_foodDetailData.orderNum) != 0)
    {
        (_foodDetailData.orderNum)--;
        _numLabel.text = @(_foodDetailData.orderNum).description;
    }
    if ((_foodDetailData.orderNum) == 0)
    {
        _reduceBtn.hidden = YES;
        _numLabel.hidden = YES;
    }
}
//重写set方法
-(void)setFoodDetailData:(SUFoodDetailModel *)foodDetailData
{
    _foodDetailData = foodDetailData;
    //赋值
    //图片
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[_foodDetailData.picture stringByDeletingPathExtension]]];
    //名称
    _foodNameLabel.text = foodDetailData.name;
    //描述
    _foodInforLabel.text = foodDetailData.desc;
    //评价
    _praiseLabel.text = foodDetailData.praise_content ;
    //价格
    _priceLabel.text = [NSString stringWithFormat:@"¥%.f",foodDetailData.min_price];
    //月售
    _monthSaleLabel.text = foodDetailData.month_saled_content;
    //点餐数量
    _numLabel.text = @(foodDetailData.orderNum).description;
    if((_foodDetailData.orderNum) == 0)
    {
        _numLabel.hidden = YES;
        _reduceBtn.hidden = YES;
    }else
    {
        _numLabel.hidden = NO;
        _reduceBtn.hidden = NO;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
