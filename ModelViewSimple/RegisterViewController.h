//
//  RegisterViewController.h
//  IOS_Demo
//
//  Created by 赖显波 on 7/10/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property(weak, nonatomic) IBOutlet UITextField *textUsername;

-(IBAction)done:(id)sender;

-(IBAction)save:(id)sender;

@end
