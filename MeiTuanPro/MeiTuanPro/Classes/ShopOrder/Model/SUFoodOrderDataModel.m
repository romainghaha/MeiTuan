//
//  SUFoodOrderDataModel.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodOrderDataModel.h"

@implementation SUFoodOrderDataModel


+(instancetype)foodOrderDataModelMakeWithDic:(NSDictionary *)dic
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dic];
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"spus"])
    {
        //创建数组存储模型数据
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            SUFoodDetailModel *model = [SUFoodDetailModel foodDetailDataModelMakeWithDic:dic];
            [arrM addObject:model];
        }
        _foodDetailData = arrM.copy;
    }
}

@end
