//
//  StrategySectionView.h
//  LWS
//
//  Created by 张凯 on 16/8/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrategySectionView : UICollectionReusableView

@property(nonatomic, strong) IBOutlet UIView * marginTopView;
@property (strong, nonatomic) IBOutlet UIButton *viewAllBtn;

//隐藏顶部分割线
- (void)hideMarginTopView:(BOOL)hide;

@end
