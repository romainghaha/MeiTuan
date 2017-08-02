//
//  UIView+Addition.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/2.
//  Copyright © 2017年 John. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

-(UIViewController *)viewController
{
    //获取下一个响应者对象
    UIResponder *resp = [self nextResponder];
    //只要有响应者就一直循环
    while(resp)
    {
        //如果当前对象是控制器就直接返回
        if([resp isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)resp;
        }
        //如果不是就继续寻找下一个响应者
        resp = [resp nextResponder];
    }
    return (UIViewController *)resp;
}


@end
