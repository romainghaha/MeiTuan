//
//  UIImage+DashLine.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/1.
//  Copyright © 2017年 John. All rights reserved.
//

#import "UIImage+DashLine.h"

@implementation UIImage (DashLine)

+(instancetype)makeDashLineWithColor:(UIColor *)color
{
    //开始图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 1), NO, 0);
    //获取当前上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    //画线
    CGContextMoveToPoint(ctr, 0, 1);
    CGContextAddLineToPoint(ctr, 4, 1);
    //设置虚线
    CGFloat lengths[] = {2,2};
    CGContextSetLineDash(ctr, 0, lengths, 2);
    //设置颜色
    [color set];
    //渲染
    CGContextStrokePath(ctr);
    //从图片类型上下文中截取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片类型上下文
    UIGraphicsEndImageContext();
    //返回图片
    return img;
}

@end
