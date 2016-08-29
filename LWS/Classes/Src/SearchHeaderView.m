//
//  SearchHeaderView.m
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SearchHeaderView.h"
#import "DEFINE.h"

#define marginX  15.0
#define marginY  15.0
#define Btn_height  28.0

@interface SearchHeaderView()
@property(nonatomic, strong) UILabel * titleLabel;
@property(nonatomic, strong) UIView * line;
@property(nonatomic, strong) UIView * contentView;

@end

@implementation SearchHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.btnTitles = [[NSMutableArray alloc] init];
    [self.btnTitles addObjectsFromArray: @[@"零食", @"手机壳", @"双肩包", @"钱包", @"凉鞋", @"手表", @"情侣", @"泳衣", @"杯子", @"连衣裙", @"手链", @"宿舍" ]];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.line];
    [self addSubview:self.contentView];
    
    [self setupBtns];
}

- (void)setupBtns{
    UIButton *tempBtn;  //用来计算换行  记录最后一个button
    
    for (int i = 0; i < self.btnTitles.count; i++) {
        UIButton *tagBtn = [self _createBtn];
        NSString *titleStr = self.btnTitles[i];
        CGFloat width = [titleStr boundingRectWithSize:CGSizeZero
                                              options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName : tagBtn.titleLabel.font}
                                              context:nil].size.width+ 20 * 2;
        
        tagBtn.tag = i;
        [tagBtn setTitle:titleStr forState:UIControlStateNormal];
        [tagBtn addTarget:self action:@selector(tagBtnAction) forControlEvents:UIControlEventTouchUpInside];
        tagBtn.yzSize = CGSizeMake(width, Btn_height);
        [self.contentView addSubview:tagBtn];
        
        
        if (tempBtn == nil) {
            tagBtn.yzOrigin = CGPointMake(marginX, marginY);
        }else{
            BOOL isWrap = (KScreenWidth - tempBtn.yzRight - marginX) < (tagBtn.yzWidth + marginX);
            if (isWrap) {  //换行
                tagBtn.yzOrigin = CGPointMake(marginX, tempBtn.yzBottom + marginY);
            } else{  //不换行
                tagBtn.yzOrigin = CGPointMake(tempBtn.yzRight + marginX, tempBtn.yzOrigin.y);
            }
        }
        tempBtn = tagBtn;
    }
    
    
    //设置contentView的大小
    self.contentView.frame = CGRectMake(0, self.line.yzBottom, KScreenWidth, tempBtn.yzBottom+marginY);
}


- (UIButton *)_createBtn{
    UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tagBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    tagBtn.layer.cornerRadius = 3.0;
    tagBtn.layer.masksToBounds = true;
    tagBtn.layer.borderWidth = 0.5;
    tagBtn.layer.borderColor = UICOLOR_RGB(221, 221, 221, 1.0).CGColor;
    [tagBtn setTitleColor:UICOLOR_RGB(80, 80, 80, 1.0) forState: UIControlStateNormal];
    return tagBtn;
}


#pragma mark - action
- (void)tagBtnAction{
    NSLog(@"发出通知 检索");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Notif_BtnAction_SearchTag" object:nil];
}

- (CGFloat)getHeight{
    return  self.contentView.yzBottom;
}


#pragma mark - 懒加载

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
        _titleLabel.text = @"    大家都在搜";
        _titleLabel.backgroundColor = Color_GlobalBackground;
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = UICOLOR_RGB(150, 150, 153, 1.0);
    }
    return _titleLabel;
}

- (UIView *)line{
    if (_line == nil) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleLabel.yzBottom, KScreenWidth, 0.5)];
        
        _line.backgroundColor = UICOLOR_RGB(221, 221, 221, 1.0);
    }
    return _line;
}

- (UIView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

@end
