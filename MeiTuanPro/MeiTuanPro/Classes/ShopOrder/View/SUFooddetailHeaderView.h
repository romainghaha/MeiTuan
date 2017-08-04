//
//  SUFooddetailHeaderView.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/4.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SUFoodOrderDataModel;
@interface SUFooddetailHeaderView : UITableViewHeaderFooterView

//传入组头数据
@property(nonatomic,strong)SUFoodOrderDataModel *foodOrderData;
//名称
@property(nonatomic,copy)NSString *name;
@end
