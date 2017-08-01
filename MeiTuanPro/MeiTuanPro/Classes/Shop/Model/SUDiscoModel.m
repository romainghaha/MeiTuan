//
//  SUDiscoModel.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUDiscoModel.h"

@implementation SUDiscoModel

+(instancetype)makeDiscoModelWithDic:(NSDictionary *)dic
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dic];
    return obj;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
