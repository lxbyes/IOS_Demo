//
//  ViewController.m
//  IOS_Demo
//
//  Created by 赖显波 on 7/8/15.
//  Copyright (c) 2015 赖显波. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    self.label.text = @"Hello, World!";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    [super viewWillDisappear:animated];
}

-(void)keyboardDidShow: (NSNotification *)notification {
    NSLog(@"键盘开启！");
}

-(void)keyboardDidHide: (NSNotification *)notification {
    NSLog(@"键盘关闭！");
}

- (IBAction)valueChanged:(id)sender {
    UISwitch *sw = (UISwitch*)sender;
    BOOL isOn = sw.isOn;
    [self.leftSwitch setOn:isOn animated:YES];
    [self.rightSwitch setOn:isOn animated:YES];
}

- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider*)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *text = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    self.label.text = text;
}

- (IBAction)touchDown:(id)sender {
    if(self.leftSwitch.hidden == YES) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
    }
}

-(IBAction)testAlertView:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert test" message:@"Alert test goes here!" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [alertView show];

}

-(IBAction) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.label.text = [[NSString alloc] initWithFormat:@"buttonIndex=%d", buttonIndex];
}

-(IBAction)testActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"danger" otherButtonTitles:@"FaceBook", @"Sina Weibo", @"Wechat", @"Twitter", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.label.text = [[NSString alloc] initWithFormat:@"buttonIndex=%d", buttonIndex];
}

-(IBAction)onItemClick:(id)sender {
    UIBarButtonItem *item = (UIBarButtonItem *)sender;
    self.label.text = [[NSString alloc] initWithFormat:@"tag=%d", item.tag];
}

@end
