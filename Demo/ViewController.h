//
//  ViewController.h
//  Demo
//
//  Created by 刘隆昌 on 15-4-11.
//  Copyright (c) 2015年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecipeCollectionHeaderView.h"


@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property(strong,nonatomic)UICollectionView * collectionView;



@end

