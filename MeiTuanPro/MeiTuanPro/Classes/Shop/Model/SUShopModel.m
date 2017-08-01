//
//  SUShopModel.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopModel.h"

@implementation SUShopModel

+(instancetype)makeShopModelWithDic:(NSDictionary *)dic
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dic];
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //抛出的折扣信息
    if([key isEqualToString:@"discounts2"])
    {
        //把抛出的折扣信息存储数组,数组里装的是字典
        NSArray *discoArr = value;
        //创建一个可变数组存储转模型的字典
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:discoArr.count];
        //字典转模型
        for(NSDictionary *dic in discoArr)
        {
            SUDiscoModel *model = [SUDiscoModel makeDiscoModelWithDic:dic];
            [arrM addObject:model];
        }
        //给属性赋值
        _discoDataModel = arrM.copy;   
    }
}

@end
