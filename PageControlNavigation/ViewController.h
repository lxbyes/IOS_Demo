//
//  ViewController.h
//  PageControlNavigation
//
//  Created by 赖显波 on 7/10/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) UIView *page1;

@property (strong, nonatomic) UIView *page2;

@property (strong, nonatomic) UIView *page3;

-(IBAction)changePage:(id)sender;

@end

