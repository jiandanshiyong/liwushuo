//
//  MeOptionView.m
//  LWS
//
//  Created by 张凯 on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MeOptionView.h"
#import "DEFINE.h"
#import "Masonry.h"
#import "ButtonTitleDown.h"

@interface MeOptionView ()

@property(nonatomic, strong) NSMutableArray * btnArray;
@property(nonatomic, strong) UIView * line;

@end

@implementation MeOptionView

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
    self.btnArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    [self addSubview:[self _createBtnWithImageName:@"shopcart_bt" title:@"购物车"]];
    [self addSubview:[self _createBtnWithImageName:@"order_bt" title:@"订单"]];
    [self addSubview:[self _createBtnWithImageName:@"discount_bt" title:@"礼劵"]];
    [self addSubview:[self _createBtnWithImageName:@"costomer_bt" title:@"客服"]];
    [self addSubview:self.line];
}

- (void)setupUIFrame{
    int i = 0;
    CGFloat width = self.yzWidth/4;
    CGFloat height = self.yzHeight;
    
    for (UIButton *btn in self.btnArray) {
        btn.frame = CGRectMake(i *width, 0, width, height);
        btn.tag =i;
        i +=1;
    }
    
    __weak __typeof(&*self) ws = self;
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(ws);
        make.height.equalTo(@0.5);
    }];
}


- (UIButton *)_createBtnWithImageName: (NSString *)imageName title: (NSString *)title{
    ButtonTitleDown *btn = [ButtonTitleDown buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UICOLOR_RGB(60.0, 60.0, 60.0, 1.0) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnArray addObject:btn];
    
    return btn;
}

#pragma mark - 懒加载
- (UIView *)line{
    if (_line == nil) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = UICOLOR_RGB(208.0, 208.0, 208.0, 1.0);
    }
    return _line;
}


#pragma mark - action
- (void)buttonAction:(UIButton *)button{
    NSLog(@"购物车/订单/礼券/客服  %ld",button.tag);
}

@end
