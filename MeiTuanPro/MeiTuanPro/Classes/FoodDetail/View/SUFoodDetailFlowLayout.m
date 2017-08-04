//
//  SUFoodDetailFlowLayout.m
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/4.
//  Copyright © 2017年 John. All rights reserved.
//

#import "SUFoodDetailFlowLayout.h"

@implementation SUFoodDetailFlowLayout
-(void)prepareLayout
{
    [super prepareLayout];
    //最小行间距
    self.minimumLineSpacing = 0;
    //最小item间距
    self.minimumInteritemSpacing = 0;
    //item大小
    self.itemSize = self.collectionView.bounds.size;
    //滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}
@end
