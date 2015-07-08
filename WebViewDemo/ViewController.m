//
//  ViewController.m
//  WebViewDemo
//
//  Created by 赖显波 on 7/8/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loadHtml:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    NSError *error = nil;
    
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error: &error];
    
    if(error == nil) {
        [self.webView loadHTMLString:html baseURL:url];
    }
}

-(IBAction)loadData:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    NSData *htmlData = [[NSData alloc] initWithContentsOfFile:htmlPath];
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:bundleUrl];
}

-(IBAction)loadRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"]);
}

@end
