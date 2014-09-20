//
//  DXListViewController.m
//  DayX
//
//  Created by Chad on 9/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListViewController.h"
#import "DXListTableViewDataSource.h"
#import "DetailViewController.h"
#import "ESEntryController.h"

@interface DXListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DXListTableViewDataSource *dataSource;

@end

@implementation DXListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.dataSource = [DXListTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
                      
    self.tableView.delegate = self;
    self.title = @"Entries";
    self.tableView.backgroundColor = [UIColor yellowColor];
    
    
    [self.view addSubview:self.tableView];
    
    // add + button to add entry
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newEntry:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}
                      
 
                      
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailViewController = [DetailViewController new];
    
    NSDictionary *dict = [ESEntryController sharedInstance].entries[indexPath.row];
    
    [detailViewController updateWithDictionary:dict];
    
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
                          
}


- (void)newEntry:(id)sender {
    
    DetailViewController *detailViewController = [DetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    // newEntry *entry = [newEntry new];
    // [[ESEntryController sharedInstance] addEntry:entry];
    
    
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
