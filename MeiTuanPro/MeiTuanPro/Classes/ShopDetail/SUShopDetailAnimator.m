//
//  SUShopDetailAnimator.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/2.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUShopDetailAnimator.h"

typedef enum : NSUInteger
{
    shopDetailTransitionAnimatorTypePresent,
    shopDetailTransitionAnimatorTypeDismiss
}shopDetailTransitionAnimatorType;

@interface SUShopDetailAnimator ()<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign)shopDetailTransitionAnimatorType transitionType;

@end

@implementation SUShopDetailAnimator
//此方法是modal的present时调用,谁来处理present及其转场动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    _transitionType = shopDetailTransitionAnimatorTypePresent;
    return self;
}
//此方法是modal的dismiss时调用,谁来处理dismiss机器转场动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    _transitionType = shopDetailTransitionAnimatorTypeDismiss;
    return self;
}

//转场时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}
//modal的present和dismiss时都会调用此方法
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获取来源控制器
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //获取目标控制器
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //获取容器视图,视图转场用显示出来时必须要放到容器视图中
    UIView *containView = [transitionContext containerView];
    
    if(_transitionType == shopDetailTransitionAnimatorTypePresent)
    {
        //一开始小的看不见
        toView.transform = CGAffineTransformMakeScale(0, 0);
        //添加进容器视图
        [containView addSubview:toView];
        //动画
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            //恢复到初始大小
            toView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //告诉系统完成转场,不能不交互
            [transitionContext completeTransition:YES];
        }];
    }else
    {
        //
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            //
            fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
        } completion:^(BOOL finished) {
            //告诉转场完成,不能无法交互
            [transitionContext completeTransition:YES];
        }];
    }
}
@end
