//
//  PopoverSortGifView.m
//  LWS
//
//  Created by 张凯 on 16/8/23.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "PopoverSortGifView.h"
#import "DEFINE.h"
#import "UIButton+extension.h"


#define btnColumn  3
#define btnMargin 15.0
#define btnWidth (kScreenWidth - (btnColumn + 1)* btnMargin) / btnColumn
#define btnHeight 44.0

@interface PopoverSortGifView()
@property(nonatomic, strong) UIView * maskCoverView; //全屏蒙版

@property(nonatomic, strong) NSMutableDictionary * popoCoverDic; //存储 4个弹出的分类面板
@property(nonatomic, strong) NSMutableDictionary * cacheSelectTagBtn; //缓存当前所选的按钮

@property(nonatomic, strong) UIButton * currPopBtn; //当前选中分类按钮
@property(nonatomic, strong) UIView * currPopCoverView; //当前显示的分类面板
@property(nonatomic, assign) BOOL showingPopoCover; // 显示 隐藏

@end

@implementation PopoverSortGifView

+ (instancetype)popoverSortGifView{
    return [[NSBundle mainBundle] loadNibNamed:@"PopoverSortGifView" owner:nil options:nil].lastObject;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI{
    //初始化
    self.showingPopoCover = NO;
    self.cacheSelectTagBtn =[[NSMutableDictionary alloc] init];
    
    /// 记录当前选项
    self.subjectBtn.tag = 0;
    self.characterBtn.tag = 1;
    self.occasionBtn.tag = 2;
    self.priceBtn.tag = 3;
    
    /// 给蒙版绑定点击事件
    UITapGestureRecognizer *hideMaskCoverViewPan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopoverView)];
    [self.maskCoverView addGestureRecognizer:hideMaskCoverViewPan];
    
    NSArray *allTitles = @[ @[@"全部", @"男票", @"女盆友", @"闺蜜们", @"基友", @"爸爸妈妈", @"小盆友", @"同事"],
                           @[@"全部", @"生日", @"情人节", @"结婚", @"新年", @"感谢", @"纪念日", @"乔迁", @"圣诞节"],
                           @[@"全部", @"萌", @"小清新", @"创意", @"奇葩", @"文艺范", @"科技感", @"设计感"],
                           @[@"全部", @"50以下", @"50-200", @"200-500", @"500-1000", @"1000以上"]];
    self.popoCoverDic = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i<allTitles.count; i++) {
        UIView *popView = [self createPopoverView:i titles:allTitles[i]];
        [self.popoCoverDic setValue:popView forKey:[NSString stringWithFormat:@"%ld", i]];
    }
}


/** 
 创建筛选视图
 
 - parameter section: 记录当选项组
 - parameter titles:  选项组内所有标签的标题
 
 - returns: 返回筛选视图
 */
- (UIView *)createPopoverView:(NSInteger)section titles:(NSArray *)titles{
    CGFloat moveViewHeight = 30.0;
    CGFloat popoverViewHeight = 0;
    
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = Color_GlobalBackground;
    /// 添加标签按钮
    for (int i = 0; i<titles.count; i++) {
        NSInteger column = i % btnColumn;
        NSInteger row = i / btnColumn;
        
        UIButton *btn =[self createBtn:section row:i title:titles[i]];
        [popoverView addSubview:btn];
        
        CGFloat x = (btnWidth + btnMargin) * column + btnMargin;
        CGFloat y = (btnHeight + btnMargin) * row + btnMargin;
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
        popoverViewHeight = CGRectGetMaxY(btn.frame) + btnMargin;
    }
    popoverView.frame = CGRectMake(0, -popoverViewHeight, KScreenWidth, popoverViewHeight+moveViewHeight);
    
    
    /// 添加底部拖拽视图
    UIView * moveView = [[UIView alloc] init];
    moveView.frame = CGRectMake(0, popoverView.yzHeight - moveViewHeight, popoverView.yzWidth, moveViewHeight);
    moveView.backgroundColor = [UIColor whiteColor];
    [popoverView addSubview:moveView];
    
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, moveView.yzWidth, 0.5);
    line.backgroundColor = UICOLOR_RGB(223, 223, 223, 1.0);
    [moveView addSubview:line];
    
    UIImageView *moveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"giftcategorydetail_icon_fixed"]];
    moveImageView.yzCenterX = moveView.yzCenterX;
    moveImageView.yzCenterY = (moveView.yzHeight - moveImageView.yzHeight)*0.5;
    [moveView addSubview: moveImageView];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDragged:)];
    [popoverView addGestureRecognizer:gesture];
    popoverView.userInteractionEnabled = true;

    return popoverView;
}

/**
 创建标签按钮
 */
- (UIButton *)createBtn:(NSInteger)section row:(NSInteger)row title:(NSString *)title{
    UIButton *btn = [UIButton init_SrotTagTarget:self action:@selector(tagBtnAction:)];
    btn.tag = section;
    [btn setTitle:title forState:UIControlStateNormal];
    if (row == 0 ){
        /// 缓存当前所选的按钮
        btn.selected = true;
        [self.cacheSelectTagBtn setValue:btn forKey:[NSString stringWithFormat:@"%ld", btn.tag]];
    } else {
        btn.selected = false;
    }
    return btn;
}


#pragma mark - action

- (IBAction)subjectBtnAction:(id)sender {
    [self showPopoverView:sender];
}

- (IBAction)characterBtnAction:(id)sender {
    [self showPopoverView:sender];
}

- (IBAction)occasionBtnAction:(id)sender {
    [self showPopoverView:sender];
}

- (IBAction)priceBtnAction:(id)sender {
    [self showPopoverView:sender];
}

//弹出面板的手势方法
- (void)viewDragged:(UIPanGestureRecognizer *)gestureRecognizer{
    /// 从缓存取出当前按钮下的筛选视图
    NSMutableString *key =[NSMutableString stringWithFormat:@"%ld", self.currPopBtn.tag];
    UIView *popCover = self.popoCoverDic[key];

    CGFloat maxCenterY = popCover.yzHeight* 0.5 + self.yzHeight;
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if (gestureRecognizer.view.center.y > maxCenterY){
            return ;
        }
        
        CGPoint translation = [gestureRecognizer translationInView:self];
        if(gestureRecognizer.view.center.y < maxCenterY) {
            gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x, gestureRecognizer.view.center.y + translation.y);
        }else {
            gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x, maxCenterY - 0.001);
        }
        
        [gestureRecognizer setTranslation:CGPointMake(0,0) inView:self];
    }
    
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded){
        if(gestureRecognizer.view.center.y < maxCenterY * 0.5) {
            [self hidePopoverView];
        } else {
            gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x, maxCenterY);
            [gestureRecognizer setTranslation:CGPointMake(0,0) inView:self];
        }
    }

}

//标签按钮
- (void)tagBtnAction:(UIButton *)btn{
    NSMutableString *key =[NSMutableString stringWithFormat:@"%ld", btn.tag];
    UIButton *cacheBtn = self.cacheSelectTagBtn[key];
    if (cacheBtn != nil) {
        cacheBtn.selected = NO;
    }
    
    btn.selected = YES;
    [self.cacheSelectTagBtn setValue:btn forKey:[NSString stringWithFormat:@"%ld", btn.tag]];
}

//显示筛选视图
- (void)showPopoverView:(UIButton *)sender{
    sender.selected = ! sender.selected;
    
    /// 重复点击按钮
    if (self.currPopBtn == sender){
        [self hidePopoverView];
        return ;
    }
    
    /// 更改上一个按钮状态
    if (self.currPopBtn != nil) {
        self.currPopBtn.selected = !self.currPopBtn.selected;
    }
    
    /// 保存当前按钮
    self.currPopBtn = sender;
    
    /// 从缓存取出当前按钮下的筛选视图
    NSMutableString *key =[NSMutableString stringWithFormat:@"%ld", sender.tag];
    UIView *popCover = self.popoCoverDic[key];
    /// 判断筛选视图是否存在
    if (popCover == nil) {
        return ;
    }else{ /// 显示蒙版
        [self showMaskCoverView:popCover];
    }
    
    /// 显示筛选视图
    [self.superview insertSubview:popCover belowSubview: self];
    
    if (self.showingPopoCover) {
        /// 快速切换显示
        [self.currPopCoverView removeFromSuperview];
        popCover.yzTop = self.yzHeight;
    } else {
        /// 动画显示
        self.showingPopoCover = YES;
        [UIView animateWithDuration:0.3 animations:^{
            popCover.yzTop = self.yzHeight;
        }];
    }
    
   self.currPopCoverView = popCover;
}

//隐藏筛选视图
- (void)hidePopoverView{
    NSLog(@"隐藏当前筛选视图");
    if (self.currPopCoverView == nil) {
        return;
    }
    
    /// 重置状态
    self.showingPopoCover = false;
    self.currPopBtn = nil;
    
    /// 动画隐藏
    [UIView animateWithDuration:0.3 animations:^{
        self.currPopCoverView.yzTop = - self.currPopCoverView.yzHeight;
    } completion:^(BOOL finished) {
        [self.currPopCoverView removeFromSuperview];
    }];
    
    /// 隐藏蒙版
    [self hideMaskCoverView];
}

//显示蒙版
- (void)showMaskCoverView:(UIView *)belowSubview {
    [self.superview insertSubview:self.maskCoverView belowSubview: self];
}

//隐藏蒙版
- (void)hideMaskCoverView{
    [self.maskCoverView removeFromSuperview];
}


#pragma mark - 懒加载

- (UIView *)maskCoverView{
    if (_maskCoverView == nil) {
        _maskCoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        
        _maskCoverView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    }
    return _maskCoverView;
}


@end
