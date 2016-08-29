//
//  ChannelItemCell.m
//  LWS
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChannelItemCell.h"
#import "Masonry.h"
#import "UIImageView+AFNetworking.h"
#import "DEFINE.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface ChannelItemCell (){
    UILabel         *_tagLabel; //上1
    UILabel         *_shopLabel; //上2
    UIImageView     *_iconImageView;  //用户头像
    UILabel         *_autherLabel;    //昵称
    
    UIImageView     *_showImagView; //中图
    
    UILabel         *_titleLibel; //下1
    UIImageView     *_headImageView; //心形图片
    UILabel         *_likeLabel;  //点赞数
    
    UILabel         *_grayLabel;  //底部分割线
}

@end

@implementation ChannelItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initView];
    }
    return self;
}

//初始化子视图 仅添加控件
- (void)_initView{
    
    //上1
    _tagLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _tagLabel.backgroundColor = UICOLOR_RGB(255, 210, 210, 1);
    _tagLabel.font =[UIFont systemFontOfSize:12.0f];
    _tagLabel.textColor = UICOLOR_RGB(252, 64, 90, 1);
    _tagLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_tagLabel];
    
    //上2
    _shopLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _shopLabel.backgroundColor =[UIColor clearColor];
    _shopLabel.font =[UIFont systemFontOfSize:12.0f];
    _tagLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_shopLabel];
    
    //用户头像
    _iconImageView =[[UIImageView alloc] initWithFrame:CGRectZero];
    _iconImageView.backgroundColor =[UIColor clearColor];
    _iconImageView.layer.cornerRadius =5; //圆角半径
//    _iconImageView.layer.borderWidth =.5;//边框宽度
//    _iconImageView.layer.borderColor =[UIColor grayColor].CGColor;//边框颜色
    _iconImageView.layer.masksToBounds =YES; //剪切图层边界
    [self.contentView addSubview:_iconImageView];
    
    //昵称
    _autherLabel =[[UILabel alloc] initWithFrame:CGRectZero];
    _autherLabel.backgroundColor =[UIColor clearColor];
    _autherLabel.font =[UIFont systemFontOfSize:12.0f];
    _autherLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_autherLabel];
    
    //中图
    _showImagView =[[UIImageView alloc] initWithFrame:CGRectZero];
    _showImagView.backgroundColor =[UIColor clearColor];
    _showImagView.contentMode =UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_showImagView];
    
    //下1
    _titleLibel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLibel.backgroundColor =[UIColor clearColor];
    _titleLibel.font =[UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_titleLibel];
    
     //心形图片
    _headImageView =[[UIImageView alloc] initWithFrame:CGRectZero];
    _headImageView.backgroundColor =[UIColor clearColor];
    [self.contentView addSubview:_headImageView];
    
    //点赞数
    _likeLabel =[[UILabel alloc] initWithFrame:CGRectZero];
    _likeLabel.backgroundColor =[UIColor clearColor];
    _likeLabel.font =[UIFont systemFontOfSize:12.0f];
    _likeLabel.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_likeLabel];
    
    _grayLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _grayLabel.backgroundColor = UICOLOR_RGB(243, 243, 243, 1);
    [self.contentView addSubview:_grayLabel];
    
}


//设置内容 并布局
-(void)setModel:(ChannelItemModel *)model{
    _model = model;

    _tagLabel.text      = [NSString isNullJudge:_model.column.category]; //上1
    _shopLabel.text     = _model.column.title; //上2
    [_iconImageView setImageWithURL:[NSURL URLWithString:_model.author.avatar_url]
                   placeholderImage:Default_Image];  //用户头像
    _autherLabel.text   = _model.author.nickname;    //昵称

    [_showImagView setImageWithURL:[NSURL URLWithString:_model.cover_image_url]
                  placeholderImage:Default_Image]; //中图

    _titleLibel.text     = _model.title; //下1
    _headImageView.image = [UIImage imageNamed:@"myfav.png"]; //心形图片
    _likeLabel.text      = [NSString stringWithFormat:@"%@", _model.likes_count  ];  //点赞数
    
    
    //frame
    WS(ws)
    
    _tagLabel.frame = CGRectMake(10, 15, 40, 15);
    
    
    [_shopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tagLabel.mas_right).with.offset(10);
        make.top.equalTo(_tagLabel.mas_top);
        make.right.equalTo(_iconImageView.mas_left).with.offset(-10);
        make.height.mas_equalTo(@15);
    }];
    
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_tagLabel.mas_centerY);
        make.height.width.mas_equalTo(@25);
        make.right.equalTo(_autherLabel.mas_left).with.offset(-10);
    }];
    
    
    
    [_autherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_tagLabel.mas_centerY);
        make.height.mas_equalTo(@15);
        make.right.equalTo(ws.contentView).with.offset(-10);
        make.width.mas_equalTo(@50);
    }];
    
    
    [_showImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tagLabel.mas_bottom).with.offset(14);
        make.left.mas_equalTo(ws.yzLeft);
    }];
    _showImagView.yzWidth = KScreenWidth;
    _showImagView.yzHeight = KScreenWidth*150/320;
    
    
    [_titleLibel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.equalTo(_showImagView.mas_bottom).with.offset(17);
        make.right.equalTo(_headImageView.mas_left).with.offset(-10);
        make.height.mas_equalTo(@18);
    }];
    
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLibel.mas_centerY);
        make.height.width.mas_equalTo(@18);
        make.right.equalTo(_likeLabel.mas_left).with.offset(-5);
    }];
    
    
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLibel.mas_centerY);
        make.height.mas_equalTo(@18);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(@40);
    }];
    
    
    [_grayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_likeLabel.mas_bottom).with.offset(18);
        make.left.mas_equalTo(ws.yzLeft);
        make.width.equalTo(ws.mas_width);
        make.height.mas_equalTo(@4);
        
    }];

//    self.height = _grayLabel.bottom;
}


- (CGFloat)cellHeight{
//    return _grayLabel.bottom;  //严重依赖内存会卡顿
    return 260;
    
}


@end
