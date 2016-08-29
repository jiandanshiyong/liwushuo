//
//  UIView+YZTCView.m
//  YZTCChat
//
//  Created by David on 16/4/26.
//  Copyright © 2016年 育知同创. All rights reserved.
//

#import "UIView+YZTCView.h"

//#import "Header.h"


CGRect CGRectMakeForFit(CGRect rect)
{
    CGRect newRect = CGRectZero ;
    
    newRect.origin.x = CGRectGetMinX(rect)*YZScaleX;
    newRect.origin.y = CGRectGetMinY(rect)*YZScaleY;
    newRect.size.width = CGRectGetWidth(rect)*YZScaleX;
    newRect.size.height = CGRectGetHeight(rect)*YZScaleY;
    
    if (CGRectGetMinY(rect)==64) {
        newRect.origin.y = CGRectGetMinY(rect)*YZScaleY;
    }
    
    return newRect;
}



@implementation UIView (YZTCView)



- (CGPoint)yzOrigin
{
    return self.frame.origin;
}

- (void)setYzOrigin:(CGPoint)yzOrigin
{
    CGRect newframe = self.frame;
    newframe.origin = yzOrigin;
    self.frame = newframe;
}

- (CGSize)yzSize
{
    return self.frame.size;
}

- (void)setYzSize:(CGSize)yzSize
{
    CGRect newframe = self.frame;
    newframe.size = yzSize;
    self.frame = newframe;
}

- (CGPoint)yzBottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)yzBottomLeft //bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)yzTopRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}
- (CGPoint)yzTopLeft
{
    CGFloat x = self.frame.origin.x ;//+ self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGFloat)yzHeight
{
    return self.frame.size.height;
}

- (void)setYzHeight:(CGFloat)yzHeight
{
    CGRect newframe = self.frame;
    newframe.size.height = yzHeight;
    self.frame = newframe;
}

- (CGFloat)yzWidth
{
    return self.frame.size.width;
}

- (void)setYzWidth:(CGFloat)yzWidth
{
    CGRect newframe = self.frame;
    newframe.size.width = yzWidth;
    self.frame = newframe;
}

- (CGFloat)yzTop
{
    return self.frame.origin.y;
}

- (void)setYzTop:(CGFloat)yzTop
{
    CGRect newframe = self.frame;
    newframe.origin.y = yzTop;
    self.frame = newframe;
}

- (CGFloat)yzLeft
{
    return self.frame.origin.x;
}

- (void)setYzLeft:(CGFloat)yzLeft
{
    CGRect newframe = self.frame;
    newframe.origin.x = yzLeft;
    self.frame = newframe;
}

- (CGFloat)yzCenterX
{
    return self.center.x;
}

- (void)setYzCenterX:(CGFloat)yzCenterX
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = yzCenterX- newFrame.size.width/2 ;
    self.frame = newFrame;
}

- (CGFloat)yzCenterY
{
    return self.center.y ;
}

- (void)setYzCenterY:(CGFloat)yzCenterY
{
    CGRect newFrame = self.frame;
    newFrame.origin.y = yzCenterY - newFrame.size.height/2 ;
    self.frame = newFrame;
}

- (CGFloat)yzBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYzBottom:(CGFloat)yzBottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = yzBottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)yzRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYzRight:(CGFloat)yzRight
{
    CGFloat delta = yzRight - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}




#pragma mark ------------------

- (void)centerMoveBy:(CGPoint)addCenterP ;
{
    CGPoint newcenter = self.center;
    newcenter.x += addCenterP.x;
    newcenter.y += addCenterP.y;
    self.center = newcenter;
}


- (void)scaleToValue:(CGFloat)scaleValue ;
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleValue;
    newframe.size.height *= scaleValue;
    self.frame = newframe;
}


- (void)fitInSize:(CGSize)mySize ;
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > mySize.height))
    {
        scale = mySize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= mySize.width))
    {
        scale = mySize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}




/**
 *  动画（单位时间内2点之间的移动动画）
 */
- (void)startAnimationForView_time:(CGFloat)time x:(CGFloat)x y:(CGFloat)y
{
    [UIView animateWithDuration:time animations:^{
        self.transform = CGAffineTransformMakeTranslation(x , y ) ;
    }];
}
/**
 *  取消动画（恢复到起始点）
 */
- (void)endAnimationForView_time:(CGFloat)time
{
    [UIView animateWithDuration:time animations:^{
        self.transform = CGAffineTransformIdentity ;
    }] ;
}



#pragma mark - 设置圆角

- (void)setCornerOnTop:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setCornerOnBottom:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setCornerOnLeft:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setCornerOnRight:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(conner, conner)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)setAllCorner:(CGFloat) conner {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:conner];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)setBorders:(YZBorder) Borders borderColor:(UIColor*) color borderWidth:(CGFloat) width{
    if((Borders & UIBorderLeft) == UIBorderLeft)
    {
        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
        left.backgroundColor = color;
        [self addSubview:left];
    }
    if((Borders & UIBorderRight) == UIBorderRight)
    {
        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height)];
        left.backgroundColor = color;
        [self addSubview:left];
    }
    if((Borders & UIBorderTop) == UIBorderTop)
    {
        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, width)];
        left.backgroundColor = color;
        [self addSubview:left];
    }
    if((Borders & UIBorderBottom) == UIBorderBottom)
    {
        UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width)];
        left.backgroundColor = color;
        [self addSubview:left];
    }
}





/**
 *  等比例适配
 */
- (void)fitIphone6:(int)a
{
    
    if (a == 1)
    {
        for (UIView *subview in self.subviews) {
            
            subview.frame = CustomRectMake(subview.yzLeft, subview.yzTop, subview.yzWidth, subview.yzHeight) ;
        }
    }
    
    
    if (a == 2)
    {
        for (UIView *subview in self.subviews) {
            
            subview.frame = CustomRectMake(subview.yzLeft, subview.yzTop, subview.yzWidth, subview.yzHeight) ;
            
            for (UIView *subview2  in subview.subviews) {
                subview2.frame = CustomRectMake(subview2.yzLeft, subview2.yzTop, subview2.yzWidth, subview2.yzHeight) ;
            }
        }
    }
    
    if (a == 3)
    {
        for (UIView *subview in self.subviews) {
            
            subview.frame = CustomRectMake(subview.yzLeft, subview.yzTop, subview.yzWidth, subview.yzHeight) ;
            
            for (UIView *subview2  in subview.subviews) {
                subview2.frame = CustomRectMake(subview2.yzLeft, subview2.yzTop, subview2.yzWidth, subview2.yzHeight) ;
                
                for (UIView *subview3 in subview2.subviews) {
                    subview3.frame = CustomRectMake(subview3.yzLeft, subview3.yzTop, subview3.yzWidth, subview3.yzHeight) ;
                }
            }
        }
    }
    
}






- (UIViewController *)viewController
{
    UIResponder *nextVC = self.nextResponder ;
    
    while (nextVC) {
        if ([nextVC isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextVC ;
        }
        nextVC = nextVC.nextResponder ;
    }
    return nil ;
}




@end
