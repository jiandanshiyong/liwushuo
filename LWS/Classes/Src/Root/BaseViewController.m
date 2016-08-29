//
//  BaseViewController.m
//  MSJ
//
//  Created by 张凯 on 16/7/9.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseViewController.h"
#import "DEFINE.h"

@interface BaseViewController (){
    UILabel *_titleLabel ;   //标题
    
    UIImageView *_leftImgView;//左边图片
    UIButton *_leftBtn ;      //左边按钮
    
    UIImageView *_rightImgView; //右边图片
    UIButton *_rightBtn ;       //右边按钮
}

@end


@implementation BaseViewController

// 状态栏修改（1）
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 状态栏修改（2）
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
//    [self initNav];
}

- (void)initNav{
    
    // navbar
    _nav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 64) ];
    _nav.backgroundColor = Color_NavBackground ;
    [self.view addSubview:_nav] ;
    
    
    // 标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth, 44)];
    _titleLabel.font = [UIFont systemFontOfSize:18.0];
    _titleLabel.textAlignment = NSTextAlignmentCenter ;
    _titleLabel.textColor = [UIColor whiteColor] ;
    [_nav addSubview:_titleLabel] ;
    
    
    // 左边图片
    _leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 12, 15)];
    _leftImgView.yzCenterY = 20 + 44/2 ;
    _leftImgView.backgroundColor = [UIColor clearColor] ;
    [_nav addSubview:_leftImgView];
    
    
    // 左边按钮
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    _leftBtn.frame = CGRectMake(0, 0, 66, 64) ;
    _leftBtn.backgroundColor = [UIColor clearColor] ;
    [_leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [_nav addSubview:_leftBtn];
    
    
    // 右边的图片
    _rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth-55, 0, 22, 22)];
    _rightImgView.yzRight = KScreenWidth - 15 ;
    _rightImgView.yzCenterY =  20 + 44/2  ;
    _rightImgView.backgroundColor = [UIColor clearColor] ;
    [_nav addSubview:_rightImgView] ;
    
    // 右边的按钮
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    _rightBtn.frame = CGRectMake(KScreenWidth-64, 0, 64, 64) ;
    _rightBtn.backgroundColor = [UIColor clearColor];
    [_rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [_nav addSubview:_rightBtn];
    
    
    // 分割线
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _nav.yzBottom-1, KScreenWidth, .5)];
//    lineView.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1] ;
//    [_nav addSubview:lineView] ;
    
    
    /**
     *  自定义segment
     */
    _mySeg = [[CustomSegment alloc] initWithFrame:CGRectMake(99, 99, 150, 44)];
    _mySeg.center = CGPointMake(_nav.yzWidth/2.0, 20+22) ;
    _mySeg.hidden = YES  ;
    __weak __typeof(self) weakSelfj = self;
    _mySeg.block = ^(NSInteger index) {
        weakSelfj.segment_index = index;
    } ;
    [_nav addSubview:_mySeg];

}

/**
 *  初始化nav
 *
 *  @param title 字符串为标题|数组为segment
 *  @param leftImgStr 左边按钮图片(当==nil的时候隐藏，当string默认back图片)
 *  @param rightImgStr 右边按钮图片(当==nil的时候隐藏)
 *  @param bgColor     指定nav背景色 nil默认主色调
 */
- (void)initNavTitle:(id)title
             leftImg:(NSString *)leftImgStr
            rightImg:(NSString *)rightImgStr
             bgColor:(UIColor *)bgColor
{
    // 标题
    if ([title isKindOfClass:[NSString class]]) {
        _titleLabel.hidden = NO ;
        _mySeg.hidden = YES ;
        _titleLabel.text = title ;
        
    } else if([title isKindOfClass:[NSArray class]]) {
        _titleLabel.hidden = YES ;
        _mySeg.hidden = NO  ;
        _mySeg.titleArray = (NSArray *)title ;
    }
    
    
    // nav的背景色
    if (bgColor) _nav.backgroundColor = bgColor ;
    

    // 左边的图片
    if (leftImgStr == nil) {
        _leftImgView.hidden = YES ;
    } else if([leftImgStr isEqualToString:@"string"]) {
        _leftImgView.image = [UIImage imageNamed:@"back"] ;
    } else {
        _leftImgView.image = [UIImage imageNamed:leftImgStr] ;
    }
    

    // 右边的图片
    if (rightImgStr == nil) {
        _rightImgView.hidden = YES ;
    } else {
        _rightImgView.image = [UIImage imageNamed:rightImgStr] ;
    }
}


/**
 *  左边按钮点击事件
 */
- (void)leftAction{}


/**
 *  右边的点击事件
 */
- (void)rightAction{}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
