//
//  DetailViewController.m
//  DayX
//
//  Created by Chad on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *button;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Day X";
    self.view.backgroundColor = [UIColor grayColor];
    self.textField.delegate = self;

    UITextView *textView = [[UITextView alloc] init];
    [self.view addSubview:textView];
    
    UITextField *textField = [[UITextField alloc] init];
    [self.view addSubview:textField];
    
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    

    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.textField resignFirstResponder]; // makes keyboard move away
    return YES;
}



- (IBAction)clearImplementation:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
