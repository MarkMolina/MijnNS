//
//  CCAddViewController.m
//  My NS
//
//  Created by Mark Molina on 11/10/14.
//  Copyright (c) 2014 CleverCode. All rights reserved.
//

#import "CCAddViewController.h"

@interface CCAddViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) NSString *fromStation;
@property (nonatomic, strong) NSString *viaStation;
@property (nonatomic, strong) NSString *toStation;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CCAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    _fromStation = @"Station";
    _viaStation = @"No Preference";
    _toStation = @"Station";
    
    self.navigationItem.title = @"Add Trip";
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                             target:self
                                                                             action:@selector(didTapCancelButton:)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                            target:self
                                                                            action:@selector(didTapAddButton:)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)didTapCancelButton:(id)sender {
    [self.eventHandler cancel];
}

- (void)didTapAddButton:(id)sender {
    [self.eventHandler saveAddActionWithDate:self.datePicker.date andSegmentedIndex:self.segmentedControl.selectedSegmentIndex];
}

#pragma mark - CCAddViewInterface

- (void)setFromStation:(NSString *)stationName {
    _fromStation = stationName;
    NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
    [self reloadRowAtIndexPath:rowsToReload withAnimation:UITableViewRowAnimationAutomatic];
}

- (void)setViaStation:(NSString *)stationName {
    _viaStation = stationName;
    NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:1 inSection:0];
    NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
    [self reloadRowAtIndexPath:rowsToReload withAnimation:UITableViewRowAnimationAutomatic];
}

- (void)setToStation:(NSString *)stationName {
    _toStation = stationName;
    NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:2 inSection:0];
    NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
    [self reloadRowAtIndexPath:rowsToReload withAnimation:UITableViewRowAnimationAutomatic];
}

- (void)reloadRowAtIndexPath:(NSArray *)rows withAnimation:(UITableViewRowAnimation)animation {
    [_tableView reloadRowsAtIndexPaths:rows withRowAnimation:animation];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.eventHandler showStationsFromIndex:[indexPath row]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:@"To"];
            [cell.detailTextLabel setText:_fromStation];
            break;
        case 1:
            [cell.textLabel setText:@"Via"];
            [cell.detailTextLabel setText:_viaStation];
            break;
        case 2:
            [cell.textLabel setText:@"From"];
            [cell.detailTextLabel setText:_toStation];
            break;
        default:
            break;
    }
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewController *tableViewController = (UITableViewController *)segue.destinationViewController;
    _tableView = tableViewController.tableView;
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
}

@end
