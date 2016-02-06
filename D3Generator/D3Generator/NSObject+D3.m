//
//  NSObject+D3.m
//  D3Generator
//
//  Created by 莫振华 on 16/2/6.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import "NSObject+D3.h"
#import <objc/runtime.h>// 导入运行时文件

@implementation NSObject(D3)

/**
 *  根据字典生成对象，目前只支持基本类型
 *  根据字典的className决定生成
 *  @param dict 字典
 *
 *  @return id
 */
+(id)objectWithDict:(NSDictionary*)dict{
    if (!dict || !dict[@"className"]) {
        return nil;
    }
    
    Class class = NSClassFromString(dict[@"className"]);
    id object = [[class alloc]init];
    [self setPropertiesWithDict:dict object:object];
    return object;
}

/**
 *  根据字段设置对象的属性，支持基础属性
 *
 *  @param dict   字典
 *  @param object 要设置的对象
 */
-(void)setPropertiesWithDict:(NSDictionary*)dict object:(id)object{
    Class class;
    if (dict[@"className"]) {
        class = NSClassFromString(dict[@"className"]);
    }
    else{
        class = self.class;
    }
    
    NSArray *properties = [self getPropertiesWithClass:class];
    for (NSString* key in properties) {
        if (dict[key]) {
            [object setValue:dict[key] forKey:key];
        }
    }
}


-(void)setPropertiesWithDict:(NSDictionary*)dict{
    [self setPropertiesWithDict:dict object:self];
}



/**
 *  获取某个类的所有字段名
 *
 *  @param cls 要获取的类class
 *
 *  @return 返回一个数组
 */
- (NSMutableArray*)getPropertiesWithClass:(Class)cls{
    // 获取当前类的所有属性
    unsigned int count;// 记录属性个数
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    // 遍历
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    return mArray.copy;
}

- (NSMutableArray*)getProperties{
    return [self getPropertiesWithClass:self.class];
}

@end
