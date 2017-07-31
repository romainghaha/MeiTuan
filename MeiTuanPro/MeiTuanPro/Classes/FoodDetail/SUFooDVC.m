//
//  SUFooDVC.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFooDVC.h"

@interface SUFooDVC ()

@end

@implementation SUFooDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建导航栏标题
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.barTintColor = [UIColor purpleColor];
    self.navItem.title = @"青青河边草";
    self.navBar.tintColor = [UIColor redColor];
    //导航栏图片
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:nil action:nil];
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
