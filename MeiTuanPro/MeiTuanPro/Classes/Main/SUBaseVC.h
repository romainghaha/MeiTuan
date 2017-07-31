//
//  SUBaseVC.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUBaseVC : UIViewController
//外部调用Item
@property(nonatomic,strong)UINavigationItem *navItem;
//外部调用bar
@property(nonatomic,strong)UINavigationBar *navBar;
//导航图片,外部调用控制透明度
@property(nonatomic,strong)UIImageView *imageView;
//状态栏
@property(nonatomic,assign)UIStatusBarStyle statusBarStyle;
@end
