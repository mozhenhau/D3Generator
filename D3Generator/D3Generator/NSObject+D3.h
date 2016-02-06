//
//  NSObject+D3.h
//  D3Generator
//
//  Created by 莫振华 on 16/2/6.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (D3)

//通过字典生成对象, 根据字典的className决定生成
+(id)objectWithDict:(NSDictionary*)dict;

//设置对象属性值
-(void)setPropertiesWithDict:(NSDictionary*)dict;

//获取对象属性名
- (NSMutableArray*)getProperties;
- (NSMutableArray*)getPropertiesWithClass:(Class)cls;
@end
