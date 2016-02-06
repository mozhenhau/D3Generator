//
//  D3Generator.h
//  mdcnapp
//
//  Created by 莫振华 on 16/2/4.
//  Copyright © 2016年 com.mindai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface D3Generator : NSObject


+(UIViewController*)createViewControllerWithDict:(NSDictionary*)dict;


+(UIViewController*)createViewControllerWithDictAndPush:(NSDictionary*)dict;

@end
