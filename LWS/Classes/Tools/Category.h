

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>
///系统类得扩展
#warning UIColor
/**************************************  UIColor    ************************************************************************/

@interface UIColor (UIColorCategory)
/* 将16位进制转为color */
+(UIColor*)colorWithInt:(unsigned)colorValue;
//随机颜色
+ (UIColor *)RandomColor;
@end




#warning NSString
/**************************************  NSString   ************************************************************************/


@interface NSString (NSStringSize)
//时间转date
+ (NSString *)DateToString:(NSDate *)selectDate mode:(NSString *)modelString;
//date转时间
+ (NSDate*)StringToDate:(NSString*)uiDate Mode:(NSString *)modelString;
//    2014-08-08  转换为  周5
+ (NSString *)getWeekdayFromDate:(NSDate*)date;
//字符串是否是空
- (BOOL)isNullBoll;
//
+ (NSString *)since1970ToDate:(NSTimeInterval) a mode:(NSString *)modeString ;

// 判断字符串是否为nil类型
+ (NSString *)isNullJudge:(NSString *)string;

//判断手机号
+ (BOOL) isValidateMobile:(NSString *)mobile;

//强转string
+ (NSString *)everyToString:(id)a;

// 图文混排
+ (NSMutableAttributedString *)imageString:(NSString *)imgString ;


@end



#warning UILabel

@interface UILabel (UILabelCategory)
- (void)autolayoutContent:(NSString *)content
                   origin:(CGPoint)point
                FontFloat:(CGFloat)fontFloat
             contentWidth:(CGFloat)contentWidth;
@end




#warning UIImage
/************************************   UIImage     *****************************************************************************/

@interface UIImage (UIImageCategory)
+(UIImage *)imageWithColor:(UIColor *)color;

@end




#warning NSDictionary

/************************************   NSDictionary     *****************************************************************************/

@interface NSDictionary (NSDictionaryCategory)
- (NSString *)customObjectForKey:(NSString *)key;
@end







#warning UIView
/************************************   UIView   *****************************************************************************/

@interface UIView (RectCorner)


- (void)cirleView:(UIColor *)colors;
@end






#warning UINavigationBar
/************************************   UINavigationBar     ****************************************************************************/

@interface UINavigationBar (UINavigationBarCategory)
- (void)drawRect:(CGRect)rect;
@end









#warning NSObject
/**************************************     NSObject    *********************************************************************************/
@interface NSObject (NSObjectCategory)
+ (UIFont *)fitFont:(NSInteger)a;

@end












