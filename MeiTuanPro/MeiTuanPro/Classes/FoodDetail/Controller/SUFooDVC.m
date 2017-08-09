//
//  SUFooDVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFooDVC.h"
#import "SUFoodDetailFlowLayout.h"
#import "SUFoodDetailCollCell.h"
@interface SUFooDVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
//复用标识
static NSString *foodDetailColCellID = @"foodDetailColCellID";
@implementation SUFooDVC

- (void)viewDidLoad {
    
    self.imageView.alpha= 0;
    self.navBar.tintColor = [UIColor whiteColor];
    [self setUpUI];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //导航栏图片
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    //不让系统在帮助内缩
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setUpUI
{
    //创建流式布局
    SUFoodDetailFlowLayout *fdFlowLayout = [[SUFoodDetailFlowLayout alloc] init];
    //创建collection
    UICollectionView *foodDetail = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fdFlowLayout];
    //添加到视图
    [self.view addSubview:foodDetail];
    //约束
    [foodDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    //数据源代理
    foodDetail.dataSource = self;
    foodDetail.delegate = self;
    //注册cell
    [foodDetail registerClass:[SUFoodDetailCollCell class] forCellWithReuseIdentifier:foodDetailColCellID];
    //collection基本属性设置
    foodDetail.showsVerticalScrollIndicator = NO;
    foodDetail.showsHorizontalScrollIndicator = NO;
    foodDetail.bounces = NO;
    foodDetail.pagingEnabled = YES;
    foodDetail.backgroundColor = [UIColor whiteColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 *NSEC_PER_SEC)),dispatch_get_main_queue(),^{
    [foodDetail scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    });
    
}
#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _foodOrderData.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _foodOrderData[section].foodDetailData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    SUFoodDetailCollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:foodDetailColCellID forIndexPath:indexPath];
    //传入数据
    cell.foodDetailData = _foodOrderData[indexPath.section].foodDetailData[indexPath.row];
    //返回
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
