//
//  AdCell.m
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AdCell.h"
#import "SDCycleScrollView.h"
#import "BannerModel.h"
#import "SecondBannerModel.h"
#import "UIImageView+AFNetworking.h"
#import "DEFINE.h"

@interface AdCell ()<SDCycleScrollViewDelegate>{
    SDCycleScrollView *_sdscrollView;
    
    UIScrollView *_scrollView;
    
}
@end

@implementation AdCell

//纯代码的cell布局 初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSDscrollView];
        
        [self createSecBannerView];
        
        UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _scrollView.yzBottom+10, KScreenWidth, 10)];
        grayLabel.backgroundColor = UICOLOR_RGB(243, 243, 243, 1);
        [self.contentView addSubview:grayLabel];
    }
    return self;
}


//三方库创建AD
- (void)createSDscrollView{
    _sdscrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 135) imageURLStringsGroup:nil];
    _sdscrollView.delegate =self;
    
    _sdscrollView.showPageControl = YES;
    _sdscrollView.autoScrollTimeInterval = 5.0f;
    _sdscrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    [self.contentView addSubview:_sdscrollView];
}

//第二滚动导航
- (void)createSecBannerView{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _sdscrollView .yzBottom+10,KScreenWidth, 80)];
    _scrollView.bounces =NO;
    _scrollView.pagingEnabled =YES;
    _scrollView.showsHorizontalScrollIndicator= NO;
    
    [self.contentView addSubview:_scrollView];
}


#pragma mark - setter
- (void)setBannerArr:(NSMutableArray *)bannerArr{
    _bannerArr = bannerArr;
    
    NSMutableArray *imageURLArr = [[NSMutableArray alloc] init];
    NSMutableArray *titleArr = [[NSMutableArray alloc] init];
    for (BannerModel *model in _bannerArr) {
        NSString *imageURL = model.image_url;
//        NSString *title = model.name;

        [imageURLArr addObject:imageURL];
//        [titleArr addObject:title];
    }
    
    _sdscrollView.imageURLStringsGroup =imageURLArr;
    _sdscrollView.titlesGroup = titleArr;

}

- (void)setSecBannerArr:(NSMutableArray *)secBannerArr{
    _secBannerArr = secBannerArr;
    
    //
    for (NSInteger i =0; i<secBannerArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(10+(80 +10)*i, 0, 80, 80);
        imageView.tag= i;
        
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        
        SecondBannerModel *model = secBannerArr[i];
        [imageView setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:Default_Image];
        
        [_scrollView addSubview:imageView];
    }
    
    //
    _scrollView.contentSize = CGSizeMake(10+secBannerArr.count*(80+10), 80);

}


#pragma mark - 第二导航动画点击手势
- (void)tapAction:(UITapGestureRecognizer *)gesture{
    UIImageView *imgeView = (UIImageView *)gesture.view;
    SecondBannerModel *model =_secBannerArr[imgeView.tag];
    
    if(imgeView.tag == 0){ //第一个  //liwushuo:///page?type=243
        return ;
    }
    if (imgeView.tag == _secBannerArr.count-1) { //最后一个
        return ;
    }
    
     //目前直接使用的官网的H5页面  应该使用iOS原生
    //liwushuo:///page?type=topic&topic_id=243
    NSMutableString *target_url = [NSMutableString stringWithString:model.target_url];
    NSRange range = [target_url rangeOfString:@"liwushuo:///page?type=topic&topic_id="];
    NSString *idStr = [target_url substringFromIndex:range.length];
 
    
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    [urlStr appendString:@"http://www.liwushuo.com/collections/"];
    [urlStr appendString:idStr];
    
    if (_delegate &&  [_delegate respondsToSelector:@selector(didSelectAdCellWithId:)]) {
        [_delegate didSelectAdCellWithId:urlStr];
    }
    
}


#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    BannerModel *model = _bannerArr[index];
    
    //目前直接使用的官网的H5页面  应该使用iOS原生
    NSString *idStr = [model.target_id stringValue];
    NSString *type = model.type;
    
    NSString *urlStr;
    if ([type isEqualToString:@"collection"]) {
        urlStr = [NSString stringWithFormat:@"http://www.liwushuo.com/collections/%@", idStr];
    }
    if ([type isEqualToString:@"post"]) {
        urlStr = [NSString stringWithFormat:@"http://www.liwushuo.com/posts/%@", idStr];
    }
    
    if (_delegate &&  [_delegate respondsToSelector:@selector(didSelectAdCellWithId:)]) {
        [_delegate didSelectAdCellWithId:urlStr];
    }
}


@end
