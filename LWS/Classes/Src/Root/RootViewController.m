//
//  RootViewController.m
//  MSJ
//
//  Created by 张凯 on 16/7/9.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "RootViewController.h"
#import "BaseNavigationController.h"
#import "DEFINE.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)initView{
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"ChannelsViewController",
                                   kTitleKey  : @"礼物说",
                                   kImgKey    : @"tabbar_home",
                                   kSelImgKey : @"tabbar_home_selected"},
                                 
                                 @{kClassKey  : @"HotViewController",
                                   kTitleKey  : @"热门",
                                   kImgKey    : @"tabbar_gift",
                                   kSelImgKey : @"tabbar_gift_selected"},
                                 
                                 @{kClassKey  : @"ClassifyViewController",
                                   kTitleKey  : @"分类",
                                   kImgKey    : @"tabbar_category",
                                   kSelImgKey : @"tabbar_category_selected"},
                                 
                                 @{kClassKey  : @"MeViewController",
                                   kTitleKey  : @"我",
                                   kImgKey    : @"tabbar_me",
                                   kSelImgKey : @"tabbar_me_selected"}
                                 ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *view = [self getViewController:dic[kClassKey]
                                               withTitle:dic[kTitleKey]
                                               withImage:dic[kImgKey]
                                       withSelectedImage:dic[kSelImgKey]];
        
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:view];
        
        [self addChildViewController:nav];
    }];
    
}

- (UIViewController *)getViewController:(NSString *)className
                              withTitle:(NSString *)title
                              withImage:(NSString *)imageName
                      withSelectedImage:(NSString *)selectedImageName  {
    
    UIViewController *view = [[NSClassFromString(className) alloc] init];
    
    view.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                    image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            selectedImage:[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //设置tabbar文字颜色
    [view.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Color_NavBackground} forState:UIControlStateSelected];
    
    return view;
}



#pragma mark - UINavigationControllerDelegate
//进入第二层以上 隐藏tabbar nav.delegate = self;
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSInteger count = navigationController.viewControllers.count;
    if (count >= 2) {
        self.tabBar.hidden = YES;
    }else{
        self.tabBar.hidden = NO;
    }
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
