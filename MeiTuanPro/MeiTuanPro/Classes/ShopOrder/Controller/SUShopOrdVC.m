//
//  SUShopOrdVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/31.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopOrdVC.h"
#import "SUFoodOrderDataModel.h"
#import "SUFoodCategoryCell.h"
#import "SUFoodDetailCell.h"
#import "SUFooddetailHeaderView.h"
#import "SUFooDVC.h"
@interface SUShopOrdVC ()<UITableViewDelegate,UITableViewDataSource>

//商品类型表格
@property(nonatomic,weak)UITableView *foodType;
//商品详细表格
@property(nonatomic,weak)UITableView *foodDetail;
//商品数据保存
@property(nonatomic,strong)NSArray<SUFoodOrderDataModel*> *foodOrderModelData;
//记录类别表格是不是手动选中
@property(nonatomic,assign)BOOL foodTypeClick;

@end

//cell复用标识
static NSString *foodTypeCellID = @"foodTypeCellID";
static NSString *foodDetailCellID = @"foodDetailCellID";
//组头复用标识
static NSString *foodDetailViewID = @"foodDetailViewID";

@implementation SUShopOrdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    //加载数据
    [self loadFoodOrderData];
    
    [self setUpUI];
}
//界面搭建
-(void)setUpUI
{
    //商品种类
    UITableView *foodType = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    //取消分割线
    foodType.separatorStyle = UITableViewCellSeparatorStyleNone;
    //默认选中
    
    //添加到视图
    [self.view addSubview:foodType];
    //约束
    [foodType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.offset(100);
    }];
    foodType.rowHeight = 60;
    //注册
    [foodType registerClass:[SUFoodCategoryCell class] forCellReuseIdentifier:foodTypeCellID];
    //代理数据源
    foodType.dataSource =self;
    foodType.delegate = self;
    //给属性赋值
    _foodType = foodType;
    //默认选中第一行
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    [foodType selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    
    //商品详细
    UITableView *foodDetail = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

    //添加到视图
    [self.view addSubview:foodDetail];
    //约束
    [foodDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(foodType.mas_right).offset(0);
        make.right.offset(0);
    }];

    //注册
    
    [foodDetail registerClass:[SUFoodDetailCell class] forCellReuseIdentifier:foodDetailCellID];
    //[foodDetail registerNib:[UINib nibWithNibName:@"SUFoodDetailCell" bundle:nil] forCellReuseIdentifier:foodDetailCellID];
    //注册组头
    [foodDetail registerClass:[SUFooddetailHeaderView class] forHeaderFooterViewReuseIdentifier:foodDetailViewID];
    foodDetail.sectionHeaderHeight = 30;
    
    //代理数据源
    foodDetail.delegate = self;
    foodDetail.dataSource = self;
    //给属性传值
    _foodDetail = foodDetail;
    //设置预估行高
    foodDetail.estimatedRowHeight = 150;
    //foodDetail.rowHeight = 150;
}

//取消选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _foodDetail)
    {
        //取消选中
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        //创建跳转的界面
        SUFooDVC *fDVC = [[SUFooDVC alloc] init];
        //传入数据
        fDVC.foodOrderData = _foodOrderModelData;
        //传入索引
        fDVC.indexPath = indexPath;
        //跳转界面
        [self.navigationController pushViewController:fDVC animated:YES];
    }
    if(tableView == _foodType)
    {
        //索引选中
        _foodTypeClick = YES;
        //获取索引
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        //滚动
        [_foodDetail scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}
//商品详细在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_foodDetail == scrollView && _foodTypeClick == NO)
    {
        NSIndexPath *indexPath = [[_foodDetail indexPathsForVisibleRows] firstObject];
        NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        //选中
        [_foodType selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    _foodTypeClick = NO;
}
//返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == _foodType)
    {
        return 1;
    }else
    {
        return _foodOrderModelData.count;
    }
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _foodType)
    {
        return _foodOrderModelData.count;
    }else
    {
        //取出组对应的类模型
        SUFoodOrderDataModel *dm = _foodOrderModelData[section];
        //取出本组中key为详细的那一模型
        NSArray *fm = dm.foodDetailData;
        return fm.count;
    }
}
//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _foodType)
    {
        //创建cell
        SUFoodCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:foodTypeCellID forIndexPath:indexPath];
        //传入数据
        SUFoodOrderDataModel *model = _foodOrderModelData[indexPath.row];
        cell.foodType = model;
        //返回cell
        return cell;
    }
    //创建cell
    SUFoodDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:foodDetailCellID forIndexPath:indexPath];
    //取出组对应的类模型
    SUFoodOrderDataModel *dm = _foodOrderModelData[indexPath.section];
    //取出本组中key为详细的那一模型
    NSArray *fm = dm.foodDetailData;
    //传值
    cell.foodDetailData = fm[indexPath.row];
    //返回cell
    return cell;

}
//组头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //创建组头视图
    SUFooddetailHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:foodDetailViewID];
    //传值
    headView.foodOrderData = _foodOrderModelData[section];
    //返回
    return headView;
}
-(void)loadFoodOrderData
{
    //加载json
    NSData *shopJson = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil]];
    //把数据转化成字典
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:shopJson options:0 error:nil];
    //获取想要的数据
    NSArray *shopOrderArr = jsonDic[@"data"][@"food_spu_tags"];
    //创建数组保存模型
    NSMutableArray *arrM = [[NSMutableArray alloc] initWithCapacity:shopOrderArr.count];
    //字典转模型
    for(NSDictionary *dic in shopOrderArr)
    {
        SUFoodOrderDataModel *model = [SUFoodOrderDataModel foodOrderDataModelMakeWithDic:dic];
        [arrM addObject:model];
    }
    //给属性赋值
    _foodOrderModelData = arrM.copy;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
