//
//  ViewController.m
//  Demo
//
//  Created by 刘隆昌 on 15-4-11.
//  Copyright (c) 2015年 刘隆昌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64,CGRectGetWidth(self.view.frame), 250) collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    self.collectionView.backgroundColor = [UIColor purpleColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ID"];
    
    [self.view addSubview:self.collectionView];
    
    
    
    [self.collectionView registerClass:[RecipeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [self.collectionView registerClass:[RecipeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
    
}


#pragma mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 10;
    }else if (section == 1){
        return 20;
    }else{
        return 5;
    }
    
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"ID";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor colorWithRed:10*indexPath.row/255.0 green:20*indexPath.row/255.0 blue:30*indexPath.row/255.0 alpha:1.0f];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    
    cell.backgroundColor = [UIColor grayColor];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    [cell.contentView addSubview:label];
    return cell;
    
}




-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 30);
}




-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionReusableView *reusablevView = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        NSString *title = [[NSString alloc] initWithFormat:@"Recipe Group #%li",indexPath.section +1];
        headerView.title.text = title;
        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
        headerView.backgroundImage.image = headerImage;
        
        
        reusablevView = headerView;
        
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        
        
        UICollectionReusableView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor blackColor];
        
        reusablevView = footerView;
        
    }
    
    return reusablevView;
    
    
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
        return size;
    }else if (section == 1){
        
        CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
        return size;
    }else{
        
        
        CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
        return size;
        
    }

    
    return CGSizeZero;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    
//    if (section == 0) {
//        
//        CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
//        return size;
//    }else if (section == 1){
//        
//        CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
//        return size;
//    }
//    
    return CGSizeZero;
}
//=============



#pragma mark UICollectionViewDelegateFlowLayout
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10,(CGRectGetWidth(self.view.frame)-30*8)/4, 15, (CGRectGetWidth(self.view.frame)-30*8)/4);
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return 10.0;
    }
    else
    {
        return 20.0;
    }
}


//设定指定区内Cell的最小间距，也可以直接设置UICollectionViewFlowLayout的minimumInteritemSpacing属性
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return 10.0;
    }
    else
    {
        return 20.0;
    }
}

#pragma mark UICollectionViewDelegate

//当指定indexPath处的item被选择时触发
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
  //  cell.selected = YES;
    
   // [collectionView reloadData];
    cell.backgroundColor = [UIColor blueColor];
  //  [self.myArray removeObjectAtIndex:indexPath.row];
    
    
    NSLog(@"%ld ==== %ld",indexPath.section , indexPath.item);
   // [collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
}




- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
}





- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor purpleColor]];
}

- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor yellowColor]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
