//
//  BaseNavigationController.m
//  MSJ
//
//  Created by 张凯 on 16/7/9.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseNavigationController.h"
#import "DEFINE.h"
#import "UIButton+extension.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 1.增加导航条的背景
//    [self.navigationBar setBarTintColor:MAINCOLOR];
//    
//    // 2. navbar上文字属性修改
//    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:22.0f], NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    
    self.navigationBar.translucent = false;  //半透明
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:UICOLOR_RGB(251, 45, 71, 1)]
                             forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *textAttrs = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:CUSTOMFONT(15)};
    self.navigationBar.titleTextAttributes = textAttrs;
    
 
}

- (void)backBtnAction{
    [self popViewControllerAnimated:YES];
}


//重写push方法
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [UIButton init_BackTarget:self action:@selector(backBtnAction)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
