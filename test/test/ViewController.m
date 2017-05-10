//
//  ViewController.m
//  test
//
//  Created by QDYB on 2017/5/2.
//  Copyright © 2017年 QDYB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{

    UIWebView *webview;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    webview=[[UIWebView alloc] initWithFrame:CGRectMake(0, 100, 375, 200)];
    webview.backgroundColor=[UIColor redColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"journalVideo" ofType:@"html"];
    webview.delegate=self;
    webview.scrollView.scrollEnabled=YES;
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    
    [webview loadHTMLString:htmlString baseURL:baseURL];
    
    [self.view addSubview:webview];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{


    


}
-(void)webViewDidFinishLoad:(UIWebView *)webView{




}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{





}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    NSString *url = request.URL.absoluteString;
    if ([url rangeOfString:@"ios://openCamera"].location != NSNotFound) {
        NSLog(@"openCamera");
        CGFloat htmlHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
        
        webview.frame=CGRectMake(0, 10, 375, htmlHeight);
        webview.scrollView.contentSize=CGSizeMake(375, htmlHeight);
        return NO;
    }
    return YES;



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
