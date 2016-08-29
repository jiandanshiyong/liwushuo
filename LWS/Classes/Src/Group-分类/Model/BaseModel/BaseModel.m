//
//  BaseModel.m
//  Mtime
//
//  Created by Mac on 15/8/3.
//  Copyright (c) 2015年 wxk. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)initWithDic:(NSDictionary *)dic {

    if (self = [super init]) {
        
        [self setAtributes:dic];
    }

    return self;
}

- (void)setAtributes:(NSDictionary *)dic {

    
    for (NSString *key in [dic allKeys]) {
        
        /*
         * img -> setImg:()
         */
        
        //取出key的首字母  并大写
        NSString *a = [[key substringToIndex:1] uppercaseString];
        //取出key的其余字符
        NSString *b = [key substringFromIndex:1];
        //将key拼成set方法名
        NSString *mothedName = [NSString stringWithFormat:@"set%@%@:",a,b];
        
        //将方法名转换成方法
        SEL mothed = NSSelectorFromString(mothedName);
        
        //获得传入的参数
        id value = [dic objectForKey:key];
        
        //判断self是否响应该方法
        if ([self respondsToSelector:mothed]) {
            
            //调用set方法  传入参数
            [self performSelector:mothed withObject:value];
        }
        
    }
    
    for (NSString *key1 in self.map) {
        
        //将方法名转换成方法
        SEL mothed = NSSelectorFromString([self.map objectForKey:key1]);
        
        //获得传入的参数
        id value = [dic objectForKey:key1];
        
        //判断self是否响应该方法
        if ([self respondsToSelector:mothed]) {
            
            //调用set方法  传入参数
            [self performSelector:mothed withObject:value];
        }
        
    }

}


@end
