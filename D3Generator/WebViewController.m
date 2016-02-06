//
//  WebViewController.m
//  D3Generator
//
//  Created by 莫振华 on 16/2/5.
//  Copyright © 2016年 莫振华. All rights reserved.
//

#import "WebViewController.h"
#import "WebViewJavascriptBridge.h"
#import "D3Generator.h"
#import "TestViewController2.h"
#import "NSObject+D3.h"

@interface WebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)WebViewJavascriptBridge *bridge;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [_webView loadHTMLString:appHtml baseURL:baseURL];
    [self addRoute:_webView];
}


-(void)addRoute:(UIWebView*)webView{
    _bridge = [WebViewJavascriptBridge bridgeForWebView:webView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"报告: IOS收到！！！");
        
        UIViewController *vc = [D3Generator createViewControllerWithDictAndPush:data];
//        [self.navigationController pushViewController:vc animated:YES];
    }];
}
@end
