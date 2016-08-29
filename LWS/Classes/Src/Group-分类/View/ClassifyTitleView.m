//
//  ClassifyTitleView.m
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ClassifyTitleView.h"
#import "DEFINE.h"


#define lineMargin 10.0
@interface ClassifyTitleView()

@property(nonatomic, strong) UIButton * strategyBtn; //攻略
@property(nonatomic, strong) UIButton * singleBtn; //单品
@property(nonatomic, strong) UIView * line; //底线(移动选中)

@end

@implementation ClassifyTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void) setupUI{
    _strategyBtn = [self createButton:@"攻略"];
    _strategyBtn.frame = CGRectMake(0, 0, self.yzWidth * 0.5, self.yzHeight);
    [_strategyBtn addTarget:self action:@selector(strategyBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_strategyBtn];
    
    _singleBtn = [self createButton:@"单品"];
    _singleBtn.frame = CGRectMake(_strategyBtn.yzRight, 0,  self.yzWidth * 0.5, self.yzHeight);
    [_singleBtn addTarget:self action:@selector(singleBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_singleBtn];
    
    _line = [[UIView alloc] initWithFrame:CGRectMake(lineMargin * 0.5, self.yzHeight - 6.0, self.yzWidth * 0.5 - lineMargin, 2.0)];
    _line.backgroundColor = [UIColor whiteColor];
    [self addSubview:_line];
}

#pragma mark - action

- (void)strategyBtnAction{
    if (_delegate && [_delegate respondsToSelector:@selector(selectedOptionAtIndex:)]) {
        NSLog(@"攻略");
        [_delegate selectedOptionAtIndex:0];
    }
}

- (void)singleBtnAction{
    if (_delegate && [_delegate respondsToSelector:@selector(selectedOptionAtIndex:)]) {
        NSLog(@"单品");
        [_delegate selectedOptionAtIndex:1];
    }
}

#pragma amrk - private

- (UIButton *)createButton:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return button;
}

#pragma amrk - 公共方法

- (void)scrollLine:(CGFloat)scrollViewWidth offsetX:(CGFloat)offsetX {
    _line.yzLeft = lineMargin * 0.5 + offsetX / scrollViewWidth * (self.yzWidth * 0.5 );
}

@end








