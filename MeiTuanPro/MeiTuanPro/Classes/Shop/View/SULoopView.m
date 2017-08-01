//
//  SULoopView.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SULoopView.h"
#import "SUInforView.h"

@interface SULoopView ()

//公告一
@property(nonatomic,weak)SUInforView *infV1;
//公告二
@property(nonatomic,weak)SUInforView *infV2;
//显示第几条数据
@property(nonatomic,assign)NSInteger currentIndex;
@end


@implementation SULoopView

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
    //布告一
    SUInforView *infV1 = [[SUInforView alloc] init];
    [self addSubview:infV1];
    [infV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-16);
    }];
    //布告二
    SUInforView *infV2 = [[SUInforView alloc] init];
    [self addSubview:infV2];
    [infV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infV1).offset(0);
        make.width.height.equalTo(infV1);
        make.top.equalTo(infV1.mas_bottom).offset(0);
    }];
    
    //给属性赋值
    _infV1 = infV1;
    _infV2 = infV2;
}
//重写set方法
-(void)setDicModelData:(NSArray<SUDiscoModel *> *)dicModelData
{
    _dicModelData = dicModelData;
    //设置数据
    [self setData];
    //视图滚动
    [self viewScroll];
}
//设置数据
-(void)setData
{
    //传值
    _infV1.discData = _dicModelData[_currentIndex];
    _infV2.discData = _dicModelData[(_currentIndex+1)%7];
}
//视图滚动
-(void)viewScroll
{
    //滚动
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //动画整体向上滚动
        [UIView animateWithDuration:0.5 animations:^{
            
            _infV1.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            _infV2.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            
        } completion:^(BOOL finished) {
            
            //索引
            _currentIndex = (_currentIndex+1)%7;
            //重新设置数据
            [self setData];
            //恢复初始位置
            _infV1.transform = CGAffineTransformIdentity;
            _infV2.transform = CGAffineTransformIdentity;
            //滚动
            [self viewScroll];
        }];
    });
}
@end
