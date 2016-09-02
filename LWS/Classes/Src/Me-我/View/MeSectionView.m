//
//  MeSectionView.m
//  LWS
//
//  Created by 张凯 on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MeSectionView.h"
#import "DEFINE.h"

@interface MeSectionView()
@property (strong, nonatomic) IBOutlet UIView *bottomLineView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomLineViewLeading;

@end

@implementation MeSectionView
- (IBAction)singleBtnAction:(id)sender {
    NSLog(@"单品");
    self.bottomLineViewLeading.constant = 0;
}

- (IBAction)strategyBtnAction:(id)sender {
     NSLog(@"攻略");
    self.bottomLineViewLeading.constant = self.yzWidth*0.5;
}

@end
