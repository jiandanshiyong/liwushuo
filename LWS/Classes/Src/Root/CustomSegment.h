//
//  CustomSegment.h
//  LWS
//
//  Created by 张凯 on 16/7/30.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CustomSegmentBlock) (NSInteger index) ;


@interface CustomSegment : UIView

@property(nonatomic, strong) CustomSegmentBlock block ; //返回点击下标

@property(nonatomic, strong) NSArray * titleArray;



@property(nonatomic, strong) UIView * lineView; // 选中某个label时下方的白线标识
//@property(nonatomic, assign) CGFloat www; // segment的宽度;
@property(nonatomic, assign) NSInteger selectedPage;


@end
