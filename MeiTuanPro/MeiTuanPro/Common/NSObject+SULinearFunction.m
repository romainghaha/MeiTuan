//
//  NSObject+SULinearFunction.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/7/30.
//  Copyright © 2017年 John. All rights reserved.
//

#import "NSObject+SULinearFunction.h"



@implementation NSObject (SULinearFunction)

-(CGFloat)linearFunctionWith:(CGFloat)result andConsulttOne:(CGPoint)consultOne andConsultTwo:(CGPoint)consultTwo
{
    /*
     consultOne.y = a * consultOne.x + b
     consultTwo.y = a * consultTwo.x + b
     
     a =consultone.y - consulttwo.y / consultone.x - consulttwo.x
     
     */
    
    CGFloat a = (consultOne.y - consultTwo.y) / (consultOne.x - consultTwo.x);
    CGFloat b = consultOne.y- consultOne.x * a;
    
    return a * result + b;
    
    
}


@end
