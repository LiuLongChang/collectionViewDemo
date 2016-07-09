//
//  RecipeCollectionHeaderView.m
//  Demo
//
//  Created by 刘隆昌 on 15-4-11.
//  Copyright (c) 2015年 刘隆昌. All rights reserved.
//

#import "RecipeCollectionHeaderView.h"

@implementation RecipeCollectionHeaderView



-(void)layoutSubviews{
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(100,5, 150, 30)];
    self.title.backgroundColor = [UIColor magentaColor];
    [self addSubview:self.title];
    self.backgroundColor = [UIColor cyanColor];
    
}


@end
