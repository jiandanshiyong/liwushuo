//
//  StrategySectionView.m
//  LWS
//
//  Created by 张凯 on 16/8/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "StrategySectionView.h"
#import "DEFINE.h"
#import "AllColumnViewController.h"
#import "AllClassifyViewController.h"

@implementation StrategySectionView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)viewAllBtnAction:(id)sender {
    UIButton *btn = sender;
   
//    sender.tag == 0 ? [AllColumnViewController new] : AllClassifyViewController()
    
    if (btn.tag == 0) {
         NSLog(@"1cell 显示全部list");
       AllColumnViewController *allColumnVC= [[AllColumnViewController alloc] init];
        
        [self.viewController.navigationController pushViewController:allColumnVC animated:YES];
    }else{
        NSLog(@"非1cell 显示全部list");
        AllClassifyViewController *allClassifyVC= [[AllClassifyViewController alloc] init];
        
        [self.viewController.navigationController pushViewController: allClassifyVC animated:YES];
    }
    
}



//隐藏顶部分割线
- (void)hideMarginTopView:(BOOL)hide{
    self.marginTopView.hidden = hide;
}

@end
