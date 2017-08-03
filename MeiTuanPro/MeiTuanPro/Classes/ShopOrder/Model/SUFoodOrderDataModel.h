//
//  SUFoodOrderDataModel.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUFoodDetailModel.h"
@interface SUFoodOrderDataModel : NSObject

//名称
@property(nonatomic,copy)NSString *name;
//商品详细
@property(nonatomic,strong)NSArray<SUFoodDetailModel *> *foodDetailData;


+(instancetype)foodOrderDataModelMakeWithDic:(NSDictionary *)dic;

@end
