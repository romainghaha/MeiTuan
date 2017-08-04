//
//  SUFooDVC.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SUBaseVC.h"
#import "SUFoodOrderDataModel.h"
@interface SUFooDVC : SUBaseVC

//传入模型数据
@property(nonatomic,strong)NSArray<SUFoodOrderDataModel *> *foodOrderData;
//传入索引
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
