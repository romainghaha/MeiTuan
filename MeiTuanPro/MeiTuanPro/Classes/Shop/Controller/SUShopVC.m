//
//  SUShopVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopVC.h"
#import "SUFooDVC.h"
#import "SUShopComVC.h"
#import "SUShopOrdVC.h"
#import "SUShopInforVC.h"
#import "SUShopHeadView.h"
#import "SUShopModel.h"

@interface SUShopVC ()<UIScrollViewDelegate>

//头部缩放视图
@property(nonatomic,strong)UIView *shopHeadView;
//右侧按钮
@property(nonatomic,strong)UIBarButtonItem *rightItem;
//商家索引视图
@property(nonatomic,strong)UIView *shopTagView;
//小索引条
@property(nonatomic,weak)UIView *smallTagView;
//滚动视图
@property(nonatomic,weak)UIScrollView *shopScrollView;
//模型数据
@property(nonatomic,strong)SUShopModel *modelData;
@end

@implementation SUShopVC

- (void)viewDidLoad
{
    //加载数据
    [self loadShopData];
    //设置界面
    [self setUpUI];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}
#pragma mark - 创建布局
-(void)setUpUI
{
    //TODO:导航栏设置
    [self setUpNav];
    //TODO:创建头部视图
    [self setUpHeaderView];
    //TODO:创建商家索引
    [self setUpShopTagView];
    //TODO:滚动视图
    [self setUpShopScrollView];
    //TODO:添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

#pragma mark - 创建标签栏
-(void)setUpShopTagView
{
    //创建
    UIView *shopTagView = [[UIView alloc] init];
    shopTagView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shopTagView];
    
    //约束
    [shopTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(_shopHeadView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    //给属性赋值
    _shopTagView = shopTagView;
    
    //创建按钮
    UIButton *btn1 = [self makeTagBtnWithTitle:@"点餐"];
    UIButton *btn2 = [self makeTagBtnWithTitle:@"评价"];
    UIButton *btn3 = [self makeTagBtnWithTitle:@"商品"];
    NSArray *btnArr = @[btn1,btn2,btn3];
    //默认在第一个btn
    btn1.titleLabel.font = [UIFont boldSystemFontOfSize:18];
//    [_shopTagView addSubview:btn1];
//    [_shopTagView addSubview:btn2];
//    [_shopTagView addSubview:btn3];
    
    [_shopTagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [_shopTagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    //创建小索引
    
    UIView *smallTagView = [[UIView alloc] init];
    smallTagView.backgroundColor = [UIColor orangeColor];
    [_shopTagView addSubview:smallTagView];
    //约束
    [smallTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.height.offset(4);
        make.width.offset(50);
        make.centerX.equalTo(btnArr[0]).offset(0);
    }];
    //属性赋值
    _smallTagView = smallTagView;
    

}
#pragma mark - 标签按钮
-(UIButton *)makeTagBtnWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [_shopTagView addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = _shopTagView.subviews.count-1;
    return btn;
}
#pragma mark - 按钮点击事件
-(void)btnClick:(UIButton *)btn
{
    [_shopScrollView setContentOffset:CGPointMake(btn.tag*_shopScrollView.bounds.size.width, 0) animated:YES];
}
#pragma mark -创建滚动视图
-(void)setUpShopScrollView
{
    //创建滚动视图
    UIScrollView *shopScrollView = [[UIScrollView alloc] init];
    shopScrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shopScrollView];
    shopScrollView.pagingEnabled = YES;
    //关闭滚动条及弹性效果
    shopScrollView.showsVerticalScrollIndicator = NO;
    shopScrollView.showsHorizontalScrollIndicator = NO;
    shopScrollView.bounces = NO;
    //约束
    [shopScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(_shopTagView.mas_bottom).offset(0);
    }];
    //商家点餐,评论,信息控制器创建
    SUShopComVC *comment = [[SUShopComVC alloc] init];
    SUShopOrdVC *order = [[SUShopOrdVC alloc] init];
    SUShopInforVC *infor = [[SUShopInforVC alloc] init];
    NSArray *vcArr = @[order,comment,infor];
    //添加到滚动视图
    for(UIViewController *vc in vcArr)
    {
        //添加视图
        [shopScrollView addSubview:vc.view];
        //建立父子关系
        [self addChildViewController:vc];
        //告知已建立关系
        [vc didMoveToParentViewController:self];
    }
    //约束
    [shopScrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.height.width.equalTo(shopScrollView);
    }];
    [shopScrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    //指定代理
    shopScrollView.delegate = self;
    //给属性赋值
    _shopScrollView = shopScrollView;
}
#pragma mark - 滚动代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滚动页数
    CGFloat page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    //小索引滚动距离
    _smallTagView.transform = CGAffineTransformMakeTranslation((_shopTagView.bounds.size.width/3.0) * page, 0);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    for(NSInteger i = 0; i < _shopTagView.subviews.count-1; i++)
    {
        UIButton *btn = _shopTagView.subviews[i];
        if(page == i)
            {
                btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            }
        else
            {
                btn.titleLabel.font = [UIFont systemFontOfSize:18];
            }
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}
#pragma mark - 导航栏设置
-(void)setUpNav
{
    //导航栏设置
    
    self.navItem.title = @"水墨江南";
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0]};
    self.imageView.alpha = 0;
}
#pragma mark - 创建头部视图
-(void)setUpHeaderView
{
    //创建头部视图
    SUShopHeadView *shopHeadView = [[SUShopHeadView alloc] init];
    shopHeadView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shopHeadView];
    
    [shopHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
    }];
    _shopHeadView = shopHeadView;
    //传入数据
    shopHeadView.shopDataModel = _modelData;
    //添加右侧按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navBar.tintColor = [UIColor whiteColor];
    self.navItem.rightBarButtonItem = rightItem;
    _rightItem = rightItem;
    
}
//手势
-(void)panGesture:(UIPanGestureRecognizer *)pan
{
    //获取滑动距离
    CGPoint p = [pan translationInView:pan.view];
    //获取头部视图的高度
    CGFloat shopHeadViewHeight = _shopHeadView.bounds.size.height;
    
    
    if (p.y + shopHeadViewHeight <= 64) {
        
        [_shopHeadView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(64);
        }];
    }else if(p.y +shopHeadViewHeight >=180)
    {
        [_shopHeadView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(180);
        }];
    }else{
    
    [_shopHeadView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.offset(p.y + shopHeadViewHeight);
    }];
    }
    [pan setTranslation:CGPointZero inView:pan.view];
    
    //设置导航条透明度
    CGPoint p1 = CGPointMake(180, 0);
    CGPoint p2 = CGPointMake(64, 1);
    CGFloat alpha = [self linearFunctionWith:shopHeadViewHeight andConsulttOne:p1 andConsultTwo:p2];
    self.imageView.alpha = alpha;
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:alpha]};
    
    //设置右侧按钮的颜色变化
    self.navBar.tintColor = [UIColor colorWithWhite:1-alpha alpha:1];
    
    //修改stateBar
    if(shopHeadViewHeight == 180 && self.statusBarStyle != UIStatusBarStyleLightContent)
    {
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    }else if(shopHeadViewHeight == 64 && self.statusBarStyle != UIStatusBarStyleDefault)
    {
        self.statusBarStyle = UIStatusBarStyleDefault;
        
    }
    
}
////页面跳转
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    SUFooDVC *fVC = [[SUFooDVC alloc] init];
//    
//    [self.navigationController pushViewController:fVC animated:YES];
//}

-(void)loadShopData
{
    //加载json
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil]];
    //把json文件转换成字典
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //获取自己想要的数据
    NSDictionary *poi_dict = jsonDic[@"data"][@"poi_info"];
    //字典转模型
    SUShopModel *modelData = [SUShopModel makeShopModelWithDic:poi_dict];
    //给属性赋值
    _modelData = modelData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
