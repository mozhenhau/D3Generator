//
//  D3Generator.m
//  mdcnapp
//
//  Created by 莫振华 on 16/2/4.
//  Copyright © 2016年 com.mindai. All rights reserved.
//  对象生成器工厂

#import "D3Generator.h"
#import <objc/runtime.h>// 导入运行时文件
#import "NSObject+D3.h"

@implementation D3Generator


/**
 *  根据字典生成viewcontroller
 *
 *  @param dict 字典
 *
 *  @return UIViewController
 */
+(UIViewController*)createViewControllerWithDict:(NSDictionary*)dict{
    if (dict[@"storyboard"]) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:dict[@"storyboard"] bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:dict[@"className"]];  //记得在storyboard的Storyboard ID改成对应的className
        [vc setPropertiesWithDict:dict];
        return vc;
    }
    else{
        UIViewController *vc = [NSObject objectWithDict:dict];
        return vc;
    }
}

/**
 *  根据字典生成viewcontroller 并自行跳转到vc。  
 *  所在vc为navigation中则pop到根页并push。
 *  所在vc为基本viewcontroller则直接present
 *
 *  @param dict 字典
 */
+(UIViewController*)createViewControllerWithDictAndPush:(NSDictionary*)dict{
    UIViewController *vc = [self createViewControllerWithDict:dict];
    if (!vc) {
        return nil;
    }
    
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {  //root为tabbar
        UITabBarController *tabVC = (UITabBarController *)rootVC;
        UIViewController *tabRootVC = tabVC.viewControllers[tabVC.selectedIndex];
        if ([tabRootVC isKindOfClass:[UINavigationController class]]) {  //tabbar的root为navigation
            [(UINavigationController *)tabRootVC pushViewController:vc animated:YES];
        }
        else{ 
            [tabRootVC presentViewController:vc animated:YES completion:nil];
        }
    }
    else if([rootVC isKindOfClass:[UINavigationController class]]){   //root为navigation
        [(UINavigationController*)rootVC pushViewController:vc animated:YES];
    }
    else{   //root为uiviewcontroller
        [rootVC presentViewController:vc animated:YES completion:nil];
    }
    return rootVC;
}
@end
