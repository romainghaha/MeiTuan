//
//  SUBaseVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUBaseVC.h"

@interface SUBaseVC ()

@end

@implementation SUBaseVC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        //创建导航控制器
        UINavigationBar *navBar = [[UINavigationBar alloc] init];
        navBar.barTintColor = [UIColor grayColor];
        _navBar = navBar;
        
        //添加一个imageView用来做渐变
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        [_navBar addSubview:imageView];
        //约束
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.offset(0);
        }];
        _imageView = imageView;
        
        //创建navigationItem
        UINavigationItem *navItem = [[UINavigationItem alloc] init];
        _navItem = navItem;
        [navBar setItems:@[navItem]];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:_navBar];
    
    //约束
    [_navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(64);
    }];
    
    //设置导航栏背景
    [_navBar setShadowImage:[UIImage new]];
    [_navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//重写set方法
-(void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

//状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
}
@end
