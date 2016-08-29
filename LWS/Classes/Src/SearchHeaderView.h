//
//  SearchHeaderView.h
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchHeaderView : UIView

@property(nonatomic, strong) NSMutableArray * btnTitles;


- (CGFloat)getHeight;  //获取真实高度
@end
