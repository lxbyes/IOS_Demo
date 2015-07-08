//
//  ViewController.h
//  WebViewDemo
//
//  Created by 赖显波 on 7/8/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(IBAction)loadHtml:(id)sender;

-(IBAction)loadData:(id)sender;

-(IBAction)loadRequest:(id)sender;

@end

