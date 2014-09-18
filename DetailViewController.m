//
//  DetailViewController.m
//  DayX
//
//  Created by Chad on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

static NSString * const entryKey = @"entryKey";
static NSString * const titleKey = @"titleKey";
static NSString * const textKey = @"textKey";

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
    
    NSDictionary *myDict = [[NSUserDefaults standardUserDefaults] objectForKey:entryKey];
    
    [self updateWithDictionary:myDict];
    

    
}


- (void)save {
    
    NSDictionary *entry = @{titleKey: self.textField.text, textKey: self.textView.text};
    [[NSUserDefaults standardUserDefaults] setObject:entry forKey:entryKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}




- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
    /*
    NSNumber *score = dictionary[scoreKey];
    
    if (score) {
        self.label.text = [score stringValue];
        self.stepper.value = [score doubleValue];
    }
    */
    
    NSString *title = dictionary[titleKey];
    self.textField.text = title;
    
    NSString *entryText = dictionary[textKey];
    self.textView.text = entryText;
    
                            /*
    if (name) {
        self.textField.text = name;
    }
                             */
    
}







- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self save];
}


- (void)textViewDidChange:(UITextView *)textView {
    
    [self save];
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