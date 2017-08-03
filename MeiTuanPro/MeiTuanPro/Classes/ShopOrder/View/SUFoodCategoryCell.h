//
//  SUFoodCategoryCell.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SUFoodOrderDataModel;
@interface SUFoodCategoryCell : UITableViewCell
//传入模型数据
@property(nonatomic,strong)SUFoodOrderDataModel *foodType;
@end
