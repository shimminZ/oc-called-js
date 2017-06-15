//
//  ViewController.m
//  OcAndJsCallEach0ther
//
//  Created by zhang on 2017/6/12.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (nonatomic,weak)UIWebView *webView ;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建webView
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    webView.delegate = self;
    webView.scrollView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    
    //html
    NSString *htmlStr = @"<body style=\"border: 2px solid\"><br><p style=\"border: 2px solid mediumaquamarine\">这是第一段文字</p><p style=\"border:5px solid lightpink\">这是第二段文字</p><p style=\"border:8px solid lime\">这是第三段文字</p></body>";
    
    //加载HTML
    [webView loadHTMLString:htmlStr baseURL:nil];

}

//oc调用js 改变p标签的背景颜色
- (IBAction)clickFirst:(id)sender{
    [self.webView stringByEvaluatingJavaScriptFromString:@"var p = document.getElementsByTagName('p'); p[0].style.backgroundColor='red';"];
}

//oc调用js 文本居中显示
- (IBAction)clickSecond:(id)sender{
    [self.webView stringByEvaluatingJavaScriptFromString:@"var p = document.getElementsByTagName('p'); p[1].style.textAlign='center';p[1].style.color='red'"];

}

//oc调用js 改变文本内容
- (IBAction)clickThird:(id)sender{
    [self.webView stringByEvaluatingJavaScriptFromString:@"var p = document.getElementsByTagName('p'); p[2].style.height='100px';p[2].innerText='你没与如期而来,这就是离别的意义';"];
    
}

//还原
- (IBAction)clickfourth:(id)sender{
    [self.webView stringByEvaluatingJavaScriptFromString:@"var p = document.getElementsByTagName('p');p[2].innerText='这是第三段文字';p[2].style.height='40px'; for (var i=0;i<p.length;i++){p[i].style.textAlign='';p[i].style.backgroundColor='';p[i].style.color='black';};"];
}





@end
