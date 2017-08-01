//
//  SUDiscoModel.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUDiscoModel : NSObject

//图片
@property(nonatomic,copy)NSString *icon_url;
//信息
@property(nonatomic,copy)NSString *info;

//类方法转模型
+(instancetype)makeDiscoModelWithDic:(NSDictionary *)dic;

@end
