//
//  SUFooddetailHeaderView.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/4.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFooddetailHeaderView.h"
#import "SUFoodOrderDataModel.h"
@implementation SUFooddetailHeaderView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor blackColor];
}
-(void)setFoodOrderData:(SUFoodOrderDataModel *)foodOrderData
{
    _foodOrderData = foodOrderData;
    self.textLabel.text = foodOrderData.name;
}
@end
