//
//  PopoverCategoryView.h
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopoverCategoryViewDelegate <NSObject>
- (void)selectedCategoryEndWithIndex:(NSInteger)index;
@end


@interface PopoverCategoryView : UIView
@property(nonatomic, strong) NSMutableArray * categoryArr; //导航数据
@property(nonatomic, strong) id<PopoverCategoryViewDelegate> delegate;


- (void)scrollCategoryBtnByIndex:(NSInteger)index; //移动标签

@end

/*
 
 
 
 */