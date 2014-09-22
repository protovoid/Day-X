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
#import "DXEntry.h"

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
    
    // [self canEditRowAtIndexPath:self];
    
    
    // add + button to add entry
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newEntry:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}


-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
 
                      
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailViewController = [DetailViewController new];
    
    DXEntry *editEntry = [ESEntryController sharedInstance].entries[indexPath.row];
    [detailViewController updateEntry:editEntry];
    
    
    // NSDictionary *dict = [ESEntryController sharedInstance].entries[indexPath.row];
    // detailViewController.dictionary = dict;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
                          
}


- (void)newEntry:(id)sender {
    
    DetailViewController *detailViewController = [DetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    // newEntry *entry = [newEntry new];
    // [[ESEntryController sharedInstance] addEntry:entry];
    
    
}


/*
// sets row editing style
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone; // no delete button
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES - able to delete all rows
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // delete code goes here
    /*
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[ESEntryController sharedInstance] removeEntry:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // create new instance of appropriate class
        // insert it into array and add a new row to the tableview
    }
     

    //[[ESEntryController sharedInstance] removeEntry:entry];
    [tableView reloadData];
    NSLog(@"Deleted row.");
}
*/



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
