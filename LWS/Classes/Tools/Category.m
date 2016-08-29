
#import "Category.h"
#import "DEFINE.h"
#define CC_MD5_DIGEST_LENGTH    16  /* digest length in bytes */





/****************************************   UIColor   *****************************************************************************************/

@implementation UIColor (UIColorCategory)
+(UIColor*)colorWithInt:(unsigned)colorValue;
{
    unsigned r = (colorValue&0x00ff0000)>>16;
    unsigned g = (colorValue&0x0000ff00)>>8;
    unsigned b = colorValue&0x000000ff;
    UIColor* color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    return color;
}

+ (UIColor *)RandomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end



/****************************************   UIImage   *****************************************************************************************/



@implementation UIImage (UIImageCategory)
+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end



#warning NSString
/***************************************    NSString    **********************************************************************************/

@implementation NSString (NSStringSize)

+ (NSDate*)StringToDate:(NSString*)uiDate Mode:(NSString *)modelString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:modelString];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+ (NSString *)DateToString:(NSDate *)selectDate mode:(NSString *)modelString
{
    NSDateFormatter *selectDateFormater = [[NSDateFormatter alloc] init];
    [selectDateFormater setDateFormat:modelString];
    NSString *selectDataString = [selectDateFormater stringFromDate:selectDate];
    return selectDataString;
}

+ (NSString *)since1970ToDate:(NSTimeInterval) a mode:(NSString *)modeString
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:a ];
    NSString *string = [NSString DateToString:date mode:modeString];
    return string;
}

- (BOOL)isNullBoll
{
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    return NO;
}
+ (NSString *)isNullJudge:(NSString *)string
{
    if ([string isKindOfClass:[NSNull class]] || !string || ![string isKindOfClass:[NSString class]] || [string isEqualToString:@"<null>"])
    {
        return @"";
    }
    
    return string;
}



//强转string
+ (NSString *)everyToString:(id)a
{
    if ([a isKindOfClass:[NSNull class]]) {
        return @"";
    }
    else if ([a isKindOfClass:[NSString class]]) {
        return a ;
    }
    else if ([[NSString stringWithFormat:@"%@", a] isEqualToString:@"(null)"]) {
        return @"" ;
    }

    return [NSString stringWithFormat:@"%@", a];
}


/*手机号码验证 MODIFIED BY HELENSONG*/
+ (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString * phoneRegex = @"^1(3[0-9]|7[0-9]|5[0-9]|8[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}




//    2014-08-08  转换为  周5
+ (NSString *)getWeekdayFromDate:(NSDate*)date
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents* components = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit |
    
    NSMonthCalendarUnit |
    
    NSDayCalendarUnit |
    
    NSWeekdayCalendarUnit |
    
    NSHourCalendarUnit |
    
    NSMinuteCalendarUnit |
    
    NSSecondCalendarUnit;
    components = [calendar components:unitFlags fromDate:date];
    NSUInteger weekday = [components weekday];// zhou  ji
    
    return [NSString stringWithFormat:@"%lu" , (unsigned long)weekday];
    
    
    if (weekday == 1) {
        return @"周天";
    }
    
    else if (weekday == 2) {
        return @"周一";
    }
    
    else if (weekday == 3) {
        return @"周二";
    }
    
    else if (weekday == 4) {
        return @"周三";
    }
    
    else if (weekday == 5) {
        return @"周四";
    }
    
    else if (weekday == 6) {
        return @"周五";
    }
    
    return @"周六";
    
}

+ (NSMutableAttributedString *)imageString:(NSString *)imgString
{
    NSTextAttachment *mTextAtt = [[NSTextAttachment alloc] init] ;
    mTextAtt.image = [UIImage imageNamed:imgString] ;
    NSAttributedString *newAttStr = [NSAttributedString attributedStringWithAttachment:mTextAtt] ;
    NSMutableAttributedString *newAttString1 = (NSMutableAttributedString *)newAttStr ;
    return newAttString1 ;
}

@end










#warning NSObect
/**************************************     NSObject    *********************************************************************************/


/**************************************     NSObject    *********************************************************************************/
@implementation NSObject (NSObjectCategory)

+ (UIFont *)fitFont:(NSInteger)a
{
    CGFloat b = 0.0 ;
    
    if (iphone5) {
        b = a ;
    }
    if (iphone6) {
        b = a + 1 ;
    }
    if (iphone6Plus) {
        b = a + 2 ;
    }
    
    UIFont *font = [UIFont systemFontOfSize:b];
    return font ;
}

@end














#warning UINavigationBar
/**************************************     UINavigationBar     *********************************************************************************/




@implementation UINavigationBar (UINavigationBarCategory)
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithInt:0xce0707]];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end
















#warning UIView

/*************************************      UIView    ****************************************************************************/

@implementation UIView (RectCorner)

- (void)cirleView:(UIColor *)colors
{
    [self.layer setCornerRadius:(self.frame.size.height/2)];
    [self.layer setMasksToBounds:YES];
    [self setContentMode:UIViewContentModeScaleAspectFill];
    [self setClipsToBounds:YES];
//    self.layer.shadowColor = [UIColor redColor].CGColor;
//    self.layer.shadowOffset = CGSizeMake(4, 4);
//    self.layer.shadowOpacity = 0.5;
//    self.layer.shadowRadius = 2.0;
    self.layer.borderColor = [colors CGColor];
    self.backgroundColor = colors;
    self.layer.borderWidth = 2.0f;
    self.userInteractionEnabled = YES;
//    self.backgroundColor = [UIColor blackColor];
}

@end





#warning UILabel

@implementation UILabel (UILabelCategory)
- (void)autolayoutContent:(NSString *)content
                   origin:(CGPoint)point
                FontFloat:(CGFloat)fontFloat
             contentWidth:(CGFloat)contentWidth
{
    NSString * tstring = content;
    self.numberOfLines = 0;
    UIFont * tfont = [UIFont systemFontOfSize:fontFloat];
    self.font = tfont;
    self.text = tstring ;
    //    [self addSubview:testlable];
    
    //给一个比较大的高度，宽度不变
    CGSize size = CGSizeMake(contentWidth , 1000);
    
    //    获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize actualsize;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
        actualsize = [tstring boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }else {
        // ios 6 下的label自适应
        actualsize = [tstring sizeWithFont:tfont constrainedToSize:CGSizeMake(280, 1000)];
        self.frame =CGRectMake(point.x, point.y, actualsize.width, actualsize.height);
    }
    self.frame =CGRectMake(point.x, point.y, actualsize.width, actualsize.height);
    
}




@end









#warning NSDictionary

/************************************   NSDictionary     *****************************************************************************/

@implementation NSDictionary (NSDictionaryCategory)
- (NSString *)customObjectForKey:(NSString *)key
{
    NSString *keyStr = [self objectForKey:key];
   
    BOOL fiv = [keyStr isKindOfClass:[NSNull class]] ? YES : NO ;
    BOOL one = [keyStr isEqualToString:@"<null>"] ? YES : NO ;
    BOOL two = [keyStr isEqualToString:@"(NULL)"] ? YES : NO ;
    BOOL thr = [keyStr isEqualToString:@"(nil)"] ? YES : NO ;
    BOOL fou = [keyStr isEqualToString:@"<nil>"] ? YES : NO ;
    BOOL six = !keyStr  ?   YES    :   NO ;
    BOOL sev = ![keyStr isKindOfClass:[NSString class]] ? YES : NO ;
    
    if (one || two || thr || fou || fiv || six || sev ) {
        return @"";
    }
    
    
    return keyStr ;
}
@end





