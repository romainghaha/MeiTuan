//
//  SUFoodDetailCollCell.h
//  MeiTuanPro
//
//  Created by 苏强 on 2017/8/4.
//  Copyright © 2017年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SUFoodDetailModel;
@interface SUFoodDetailCollCell : UICollectionViewCell

//传值
@property(nonatomic,strong)SUFoodDetailModel *foodDetailData;
@end
