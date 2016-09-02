//
//  MeFooterView.m
//  LWS
//
//  Created by 张凯 on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MeFooterView.h"
#include "DEFINE.h"
#include "Masonry.h"

@interface MeFooterView()
@property(nonatomic, strong) UIImageView * icon;
@property(nonatomic, strong) UILabel * tipLab;
@property(nonatomic, strong) UIButton * loginBtn;
@end

@implementation MeFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self setupUIFrame];
}

#pragma mark - UI

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.icon];
    [self addSubview:self.tipLab];
    [self addSubview:self.loginBtn];
    
    [self.loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupUIFrame{
    
    __weak __typeof(&*self) ws = self;
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).offset(80);
        make.centerX.equalTo(ws.mas_centerX);
    }];
    
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(10);
        make.centerX.equalTo(ws.mas_centerX);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark - aciton
- (void)loginBtnAction{
    NSLog(@"登陆 通知");
    
}

#pragma mark - 懒加载
- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_blank"]];
    }
    return _icon;
}

- (UILabel *)tipLab{
    if (_tipLab == nil) {
        _tipLab = [[UILabel alloc] init];
        _tipLab.text = @"登录以享受更多功能";
        _tipLab.textColor = UICOLOR_RGB(180.0, 180.0, 180.0, 1.0);
        _tipLab.font = [UIFont systemFontOfSize:16.0];
        _tipLab.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLab;
}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = [UIColor clearColor];
    }
    return _loginBtn;
}


@end
