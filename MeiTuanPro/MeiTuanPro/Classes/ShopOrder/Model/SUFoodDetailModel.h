//
//  SUFoodDetailModel.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUFoodDetailModel : NSObject
//月售
@property(nonatomic,copy)NSString *month_saled_content;
//品名
@property(nonatomic,copy)NSString *name;
//图片
@property(nonatomic,copy)NSString *picture;
//点赞
@property(nonatomic,copy)NSString *praise_content;
//价格
@property(nonatomic,assign)float min_price;
//描述
@property(nonatomic,copy)NSString *desc;
//记录点餐数量
@property(nonatomic,assign)NSInteger orderNum;

+(instancetype)foodDetailDataModelMakeWithDic:(NSDictionary *)dic;

@end
