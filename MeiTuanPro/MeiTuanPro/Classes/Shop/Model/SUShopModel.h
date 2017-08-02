//
//  SUShopModel.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUDiscoModel.h"
@interface SUShopModel : NSObject

//头像
@property(nonatomic,copy)NSString *pic_url;
//背景图片
@property(nonatomic,copy)NSString *poi_back_pic_url;
//店名
@property(nonatomic,copy)NSString *name;
//公告
@property(nonatomic,copy)NSString *bulletin;
//轮播图片
@property(nonatomic,strong)NSArray<SUDiscoModel *> *discoDataModel;
//配送费
@property(nonatomic,copy)NSString *shipping_fee_tip;
//起送金额
@property(nonatomic,copy)NSString *min_price;
//配送时间
@property(nonatomic,copy)NSString *delivery_time_tip;

+(instancetype)makeShopModelWithDic:(NSDictionary *)dic;

@end