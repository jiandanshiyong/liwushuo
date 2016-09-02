//
//  MeHeaderView.m
//  LWS
//
//  Created by 张凯 on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MeHeaderView.h"
#import "DEFINE.h"
#import "Masonry.h"
#import "MeOptionView.h"

#define WS(weakSelf)  __weak __typeof(&*self) weakSelf = self

@interface MeHeaderView()

@property(nonatomic, strong) UIButton * loginBtn;
@property(nonatomic, strong) UILabel * nickLab;
@property(nonatomic, strong) UIView * meOptionView;

@end

@implementation MeHeaderView

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


- (void)setupUI{
    self.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:self.bgimageView];
    [self addSubview:self.loginBtn];
    [self addSubview:self.nickLab];
    [self addSubview:self.meOptionView];
    
    [self.loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupUIFrame{
    WS(ws);
   
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@90.0);
//        make.left.equalTo((ScreenWidth - loginBtn.bounds.width) * 0.5)
        make.centerX.equalTo(ws);
    }];
    [self.nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(5.0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
    [self.meOptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.width.equalTo(ws);
        make.height.equalTo(@70.0);
    }];
}


#pragma mark - action

- (void)loginBtnAction{
    NSLog(@"登陆通知");
//    NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
}

#pragma mark - 懒加载

- (UIImageView *)bgimageView{
    if (_bgimageView == nil) {
        _bgimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_profilebackground"]];
    }
    return _bgimageView;
}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setImage:[UIImage imageNamed:@"me_avatar_boy"] forState:UIControlStateNormal];
        [_loginBtn sizeToFit];
    }
    return _loginBtn;
}

- (UILabel *)nickLab{
    if (_nickLab == nil) {
        _nickLab = [[UILabel alloc] init];
        _nickLab.text = @"登陆";
        _nickLab.textColor = [UIColor whiteColor];
        _nickLab.font = [UIFont systemFontOfSize:14.0];
        _nickLab.textAlignment = NSTextAlignmentCenter;
        [_nickLab sizeToFit];
    }
    return _nickLab;
}

- (UIView *)meOptionView{
    if (_meOptionView == nil) {
        _meOptionView = [[MeOptionView alloc] init];
        _meOptionView.backgroundColor = [UIColor whiteColor];
    }
    return _meOptionView;
}

@end
