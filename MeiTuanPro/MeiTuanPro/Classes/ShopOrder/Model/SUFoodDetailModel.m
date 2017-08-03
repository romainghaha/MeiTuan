//
//  SUFoodDetailModel.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/3.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodDetailModel.h"

@implementation SUFoodDetailModel

+(instancetype)foodDetailDataModelMakeWithDic:(NSDictionary *)dic
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dic];
    return obj;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"description"])
    {
        _desc = value;
    }
}

@end
