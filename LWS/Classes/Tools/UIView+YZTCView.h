//
//  UIView+YZTCView.h
//  YZTCChat
//
//  Created by David on 16/4/26.
//  Copyright © 2016年 育知同创. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CustomRectMake(x, y, width, height) CGRectMakeForFit(CGRectMake(x, y, width, height))

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define YZScaleX kScreenWidth/320
#define YZScaleY kScreenHeight/568


typedef NS_OPTIONS(NSUInteger, YZBorder) {
    UIBorderLeft   = 1 << 0,
    UIBorderRight  = 1 << 1,
    UIBorderTop    = 1 << 2,
    UIBorderBottom = 1 << 3,
    UIBorderAll    = ~0UL
};




/**
 *  为了适配6/6p/4 -> 以5为标准 (个人习惯)
 */
CGRect CGRectMakeForFit(CGRect rect) ;





@interface UIView (YZTCView)

@property CGPoint yzOrigin ;
@property CGSize yzSize ;

@property(readonly) CGPoint yzBottomLeft ;
@property(readonly) CGPoint yzBottomRight ;
@property(readonly) CGPoint yzTopRight ;
@property(readonly) CGPoint yzTopLeft ;

@property CGFloat yzHeight ;
@property CGFloat yzWidth ;
@property CGFloat yzTop ;
@property CGFloat yzLeft ;
@property CGFloat yzBottom ;
@property CGFloat yzRight ;
@property CGFloat yzCenterX ;
@property CGFloat yzCenterY ;



/**
 *  中心点变化
 *
 *  @param addCenterP 增加的point数值
 */
- (void)centerMoveBy:(CGPoint)addCenterP ;



/**
 *  view的缩放比例
 *
 *  @param scaleValue 比例值（0-1）
 */
- (void)scaleToValue:(CGFloat)scaleValue ;




/**
 *  按比例拉伸
 *
 *  @param mySize 目的比例值
 */
- (void)fitInSize:(CGSize)mySize ;






/**
 *  动画（单位时间内2点之间的移动动画）
 */
- (void)startAnimationForView_time:(CGFloat)time x:(CGFloat)x y:(CGFloat)y ;
/**
 *  取消动画（恢复到起始点）
 */
- (void)endAnimationForView_time:(CGFloat)time ;





/**
 *  等比例适配
 */
- (void)fitIphone6:(int)a ;




















#warning  设置圆角


- (UIViewController *)viewController;

- (void)setCornerOnTop:(CGFloat) conner;
- (void)setCornerOnBottom:(CGFloat) conner;
- (void)setCornerOnLeft:(CGFloat) conner;
- (void)setCornerOnRight:(CGFloat) conner;
- (void)setAllCorner:(CGFloat) conner;
- (void)setNoneCorner;
- (void)setBorders:(YZBorder) Borders borderColor:(UIColor*) color borderWidth:(CGFloat) width;
- (void)fitForiphone6:(int)i; //适配iphone6.iphone6plus
- (void)cirleView:(UIColor *)colors;


@end
