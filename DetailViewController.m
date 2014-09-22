//
//  DetailViewController.m
//  DayX
//
//  Created by Chad on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "ESEntryController.h"



@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>



@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) DXEntry *myEntry;
@property (nonatomic, copy) NSString *placeholder;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Edit Entry";
    self.view.backgroundColor = [UIColor yellowColor];
    self.textField.delegate = self;
    self.textView.delegate = self;
    self.textField.placeholder = @"Title";
    self.textView.text = @"";

    // [self updateWithDictionary:self.dictionary];
    [self updateEntry:_myEntry];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    

    
}


- (void)save:(id)sender {
    
    // NSDictionary *entry = @{TitleKey: self.textField.text, TextKey: self.textView.text};
    
    DXEntry *saveEntry = [DXEntry new];
    saveEntry.title = self.textField.text;
    saveEntry.note = self.textView.text;
    NSDate *now = [NSDate date];
    saveEntry.timestamp = now;
    // NSLog(@"%@", now);
    
    if (self.myEntry) {
        [[ESEntryController sharedInstance] replaceEntry:self.myEntry withEntry:saveEntry];
    } else {
        [[ESEntryController sharedInstance] addEntry:self.myEntry];
    }
    
    // [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)updateEntry:(DXEntry *)entry; {
    self.myEntry = entry;
}

//- (void)updateWithDictionary:(DXEntry *)entry {
//    self.dictionary = dictionary;
//    NSString *title = dictionary[TitleKey];
//    self.textField.text = title;
//    NSString *entryText = dictionary[TextKey];
//    self.textView.text = entryText;
//}


/*
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self save];
}


- (void)textViewDidChange:(UITextView *)textView {
    
    [self save];
}
*/


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
