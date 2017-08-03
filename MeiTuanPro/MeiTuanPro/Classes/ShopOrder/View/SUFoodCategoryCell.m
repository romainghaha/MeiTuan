//
//  SUFoodCategoryCell.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodCategoryCell.h"
#import "SUFoodOrderDataModel.h"
@implementation SUFoodCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    //字体大小
    self.textLabel.font = [UIFont systemFontOfSize:12];
    //换行
    self.textLabel.numberOfLines = 2;
    //设置背景颜色
    self.backgroundColor = [UIColor colorWithHex:0xefefef];
    //设置虚线背景
    UIImage *dashLine = [UIImage makeDashLineWithColor:[UIColor blackColor]];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithPatternImage:dashLine];
    self.backgroundView = bgView;
    //约束
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.height.offset(1);
    }];
    
    
    //设置选中样式视图
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = selectedView;
    //小黄条
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor orangeColor];
    [selectedView addSubview:yellowView];
    //约束
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(44);
        make.width.offset(4);
        make.left.offset(0);
        make.centerY.offset(0);
    }];
    
    
    
    
}
-(void)setFoodType:(SUFoodOrderDataModel *)foodType
{
    _foodType = foodType;
    //给名称赋值
    self.textLabel.text = foodType.name;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
