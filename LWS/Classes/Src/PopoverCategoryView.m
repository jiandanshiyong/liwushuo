//
//  PopoverCategoryView.m
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "PopoverCategoryView.h"
#import "ChannelsModel.h"
#import "DEFINE.h"

#define popverBtnColumn 4 //弹出分类视图的按钮列数

@interface PopoverCategoryView ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView; // 左侧滚动视图
@property (strong, nonatomic) IBOutlet UIButton *switchBtn;  //右侧弹出下侧选择按钮
@property (strong, nonatomic) IBOutlet UIView *switchCover; // 频道遮挡板

@property(nonatomic, strong) UIView *scrollBottomLineView; // 添加滚动红线
@property(nonatomic, strong) UIView *squareBottomLineView; // 添加弹出视图选中底部红线

@property(nonatomic, strong) UIView *maskCoverView; //弹出的分类视图 底层蒙版
@property(nonatomic, strong) UIView *popoverView;   // 弹出的格子分类视图
@property(nonatomic, assign) BOOL showingPopoverView; // 是否显示格子分类视图

@property(nonatomic, strong) NSMutableArray * cacheScrollCategoryBtns; // 缓存滚动分类按钮
@property(nonatomic, strong) NSMutableArray * cacheSquareCategoryBtns;// 缓存格子分类按钮
@property(nonatomic, strong) UIButton * selectedScrollCategoryBtn; // 当前所选的滚动分类按钮
@property(nonatomic, strong) UIButton * selectedSquareCategoryBtn; // 当前所选的格子分类按钮

@end

@implementation PopoverCategoryView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"PopoverCategoryView"
                                      owner:nil
                                    options:nil].lastObject;
        [self setupUI];
        
        _cacheScrollCategoryBtns = [[NSMutableArray alloc] init];
        _cacheSquareCategoryBtns = [[NSMutableArray alloc] init];
        
    }
    return self;
}

// 视图
- (void)setupUI{
    // 添加滚动红线
    _scrollBottomLineView = [[UIView alloc]init];
    _scrollBottomLineView.backgroundColor =Color_NavBackground;
    [self.scrollView addSubview: _scrollBottomLineView];
    
    //给蒙版绑定点击事件
    _maskCoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight)];
    _maskCoverView.backgroundColor = [UIColor whiteColor];
    _maskCoverView.alpha = 0.3;
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopoverView)];
    [_maskCoverView addGestureRecognizer:tap];
}


#pragma mark - setter
// setter
- (void)setCategoryArr:(NSMutableArray *)categoryArr{
    _categoryArr = categoryArr;
    
    // 设置scrollView contentSize
    _scrollView.contentSize = CGSizeMake(_categoryArr.count * 80, 0);
    

    [self createScrollCategory]; // 滚动的分类视图
     _popoverView = [self createPopoverView]; // 弹出的分类视图
}

//滚动的分类视图
- (void)createScrollCategory{
    for (int i = 0; i<_categoryArr.count; i++){
        ChannelsModel *model =  _categoryArr[i];
        UIButton *btn = [self createBtn:model.name];
        btn.tag =i;
     
        CGFloat www = 80.0;
        CGFloat xxx = www*i;
        btn.frame = CGRectMake(xxx, 0, www, 44.0);
        
        [btn addTarget:self action:@selector(scrollCategoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
        [self.cacheScrollCategoryBtns addObject:btn];
        
        if(i==0){
             [self scrollCategoryBtnAction:btn];
            
            // 设置底部线条frame
            self.scrollBottomLineView.yzLeft = 5;
            self.scrollBottomLineView.yzCenterY = self.yzHeight -2.0;
            self.scrollBottomLineView.yzSize = CGSizeMake(self.selectedScrollCategoryBtn.yzWidth-10.0, 2.0);
        }
    }
}

//弹出的分类视图
- (UIView *)createPopoverView{
    CGFloat btnWidth = KScreenWidth/popverBtnColumn;
    CGFloat btnHeight = 50;
    UIView *popoverView = [[UIView alloc] init];
    
    for (int i = 0; i<_categoryArr.count; i++){
        ChannelsModel *model =  _categoryArr[i];
        UIButton *btn = [self createBtn:model.name];
        btn.tag =i;
        
        int column = i % popverBtnColumn; //列
        int row = i/popverBtnColumn; //行
        CGFloat x = btnWidth *column;
        CGFloat y = btnHeight *row;
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
        
        [btn addTarget:self action:@selector(squareCategoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [popoverView addSubview:btn];
        
        [self.cacheSquareCategoryBtns addObject:btn];
        
        //格子线条
        UIView *view1 = [self createSubLine:(CGRectMake(btn.yzWidth -0.5, 0, 0.5, btn.yzHeight))];
        [btn addSubview:view1];
        UIView *view2 = [self createSubLine:(CGRectMake(0, btn.yzHeight-0.5, btn.yzWidth, 0.5))];
        [btn addSubview:view2];
        
        if (i == 0) {
            [self squareCategoryBtnAction:btn];
        }
    }
    
    popoverView.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = self.cacheSquareCategoryBtns.lastObject;
    CGFloat yyy= btn.yzBottom;
    popoverView.frame = CGRectMake(0, -yyy, kScreenWidth, -yyy);
    
    return popoverView;
}



#pragma mark - action
// 选中分类按钮  public
- (void)scrollCategoryBtnByIndex:(NSInteger)index{
    [self scrollCategoryBtnAction: self.cacheScrollCategoryBtns[index]];
}

//横向分类button 位置调整
- (void)scrollCategoryBtnAction:(UIButton *)btn{
    self.selectedScrollCategoryBtn.selected = false;
    btn.selected = !btn.selected ;
    self.selectedScrollCategoryBtn = btn;
    
    // 设置底部线条frame
    self.scrollBottomLineView.yzCenterX = self.selectedScrollCategoryBtn.yzCenterX;
    
    
    // 重设分类标签 的位置
    if (btn.yzCenterX <self.yzWidth *0.5){
        [self.scrollView setContentOffset:CGPointZero animated:YES];
    }
    else
    if (self.scrollView.contentSize.width > self.yzWidth &&
        btn.yzCenterX > self.yzWidth *0.5 &&
        btn.yzCenterX <(self.scrollView.contentSize.width - self.yzWidth * 0.5)) {
        [self.scrollView setContentOffset:CGPointMake(btn.frame.origin.x + btn.yzWidth * 0.5 - self.yzWidth * 0.5, 0) animated:YES];
    }
    else{
        [self.scrollView setContentOffset:CGPointMake(MAX(self.scrollView.contentSize.width - self.scrollView.bounds.size.width, 0), 0) animated:YES];
    }

//    /// 重新调用layoutSubviews
//    [self setNeedsLayout];
//
    if (_delegate && [_delegate respondsToSelector:@selector(selectedCategoryEndWithIndex:)]) {
        [_delegate selectedCategoryEndWithIndex:btn.tag];
    }
}

//弹出视图 button事件
- (void)squareCategoryBtnAction:(UIButton *)btn{
    self.selectedSquareCategoryBtn.selected = false;
    btn.selected = !btn.selected ;
    self.selectedSquareCategoryBtn = btn;
    
    
    
    //选中底部线条
//     [self.squareBottomLineView removeFromSuperview];
    self.squareBottomLineView.frame = CGRectMake(btn.yzLeft, btn.yzBottom, btn.yzWidth, 2.0);
    [self.popoverView addSubview:self.squareBottomLineView];
   
    
    if (self.showingPopoverView) {
        [self hidePopoverView];
    }
}


// 右侧分类列表  是否显示的按钮
- (IBAction)switchBtnAction:(id)sender {
    UIButton *btn = sender;
    if (!btn.selected) {
        [self showPopoverView];
    }else{
        [self hidePopoverView];
    }
}

/**
 *显示筛选视图
 */
- (void)showPopoverView{
    //右侧按钮 旋转向上
    [UIView animateWithDuration:0.1 animations:^{
        CGFloat angle=M_PI;
        self.switchBtn.transform=CGAffineTransformRotate(self.switchBtn.transform, angle);
    }];
    
    
    NSLog(@"显示");
    self.backgroundColor = self.switchCover.backgroundColor;
    self.switchBtn.selected = true;
    self.switchCover.hidden = false;
    
    // 选择格子分类按钮
    UIButton *btn = self.cacheSquareCategoryBtns[self.selectedScrollCategoryBtn.tag];
    [self squareCategoryBtnAction:(btn)];
    
    /// 显示蒙版
    [[self superview] insertSubview:self.maskCoverView belowSubview:self];
    
    // 显示筛选视图
    [[self superview] insertSubview:self.popoverView belowSubview:self];
    
    self.switchCover.alpha = 0;
    self.showingPopoverView = true;
    [UIView animateWithDuration:0.3 animations:^{
        self.switchCover.alpha = 1.0;
        self.popoverView.yzTop = self.yzHeight;
    }];
}


/**
 *隐藏筛选视图
 */
- (void)hidePopoverView{
    //右侧按钮 旋转向下
    [UIView animateWithDuration:0.1 animations:^{
        CGFloat angle=M_PI;
        self.switchBtn.transform=CGAffineTransformRotate(self.switchBtn.transform, angle);
    }];
    
    NSLog(@"隐藏");
    self.backgroundColor = [UIColor whiteColor];
    self.switchBtn.selected = false;
    self.switchCover.hidden = true;
    
    /// 选择格子分类按钮
    UIButton *btn = self.cacheScrollCategoryBtns[self.selectedSquareCategoryBtn.tag];
    [self scrollCategoryBtnAction:(btn)];
    
    //  隐藏筛选视图
    [UIView animateWithDuration:0.3 animations:^{
        self.popoverView.yzTop = -self.popoverView.yzHeight;
        self.switchCover.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.popoverView removeFromSuperview];
        self.showingPopoverView = false;
    }];
    
    /// 隐藏蒙版
    [self.maskCoverView removeFromSuperview];
}




#pragma mark - private

- (UIButton *)createBtn:(NSString *)name{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:UICOLOR_RGB(102.0, 102.0, 102.0, 1.0) forState:UIControlStateNormal];
    [btn setTitleColor:UICOLOR_RGB(251.0, 45.0, 71.0, 1.0) forState:UIControlStateSelected];
    [btn setTitle:name forState:UIControlStateNormal];
    return btn;
}

- (UIView *)createSubLine:(CGRect)frame{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = Color_GlobalLine;
    return view;
}

//懒加载
- (UIView *)squareBottomLineView{
    if (_squareBottomLineView == nil) {
        _squareBottomLineView = [[UIView alloc] init];
        
        _squareBottomLineView.backgroundColor = UICOLOR_RGB(251.0, 45.0, 71.0, 1.0);
    }
    return _squareBottomLineView;
}

@end
