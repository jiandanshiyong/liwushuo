//
//  CustomSegment.m
//  LWS
//
//  Created by 张凯 on 16/7/30.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "CustomSegment.h"
#import "DEFINE.h"

static CGFloat www;
@interface CustomSegment ()

@end

@implementation CustomSegment

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)setTitleArray:(NSArray *)titleArray{
    for (int i = 0; i<titleArray.count; i++) {
        
        www = self.yzWidth/ titleArray.count;
        CGFloat hhh = 44;
        CGFloat xxx = i*www;
        CGFloat yyy = 0 ;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(xxx, yyy, www, hhh)];
        label.backgroundColor = [UIColor clearColor];
        
        label.font = [UIFont systemFontOfSize:16.0];
        label.textColor = [UIColor whiteColor];
        label.text = titleArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.tag = 100+i;
        [self addSubview:label];
        
        
        UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        label.userInteractionEnabled = YES ;
        [label  addGestureRecognizer:labelTap];
    }
    

    _lineView = [[UIView alloc] initWithFrame:CGRectMake(5, self.yzBottom-23, www-10, 2)];
    _lineView.backgroundColor = [UIColor whiteColor];
    _lineView.layer.cornerRadius = 1.0;
    [self addSubview:_lineView];

}


- (void)setSelectedPage:(NSInteger)selectedPage{
    
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.yzLeft = 5+www*selectedPage;
    }];
}


- (void)tapAction:(UITapGestureRecognizer *)tap {
    NSInteger index =  tap.view.tag -100;
    //移动
    
    [UIView animateWithDuration:0.2 animations:^{
        _lineView.yzLeft =5+www *index;
    }];
    
    // 返回选中的下标
    if (self.block) {
        self.block(index);
    }
}



@end
