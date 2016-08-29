//
//  ClassifyTitleView.h
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassifyTitleViewDelegate <NSObject>
- (void)selectedOptionAtIndex:(NSInteger)index;
@end

@interface ClassifyTitleView : UIView

@property(nonatomic, strong) id<ClassifyTitleViewDelegate> delegate;

//移动选中 底部线条
- (void)scrollLine:(CGFloat)scrollViewWidth offsetX:(CGFloat)offsetX ;

@end
