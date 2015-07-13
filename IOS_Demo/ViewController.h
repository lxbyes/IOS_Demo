//
//  ViewController.h
//  IOS_Demo
//
//  Created by 赖显波 on 7/8/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate>

-(IBAction)testAlertView:(id)sender;

-(IBAction)testActionSheet:(id)sender;

@end

