//
//  Created by Michael Bobiney on 4/25/12.
//  Copyright (c) 2012 Tap Through Apps LLC. All rights reserved.
//

#import "TTAPickerViewController.h"
@interface TTAPickerViewController ()

@end

@implementation TTAPickerViewController {
}


@synthesize delegate = _delegate;
@synthesize dataArray = _dataArray;

#pragma mark - == Constructors ======= -

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.delegate = self;
    }
    return self;
}

#pragma mark - == Setters ========== -

-(void)setDataArray:(NSArray*)values
{
    _dataArray = values;
    [self.tableView reloadData];

//    for (NSString *str in dataArray) {
//        CGSize size = [str sizeWithFont:
//    }
}

#pragma mark - == Table Data Source ====-

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - == Table View Delegate ===-

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate pickerItemSelectedAtIndexPath:indexPath];
}

#pragma - == View Lifecycle ====-

-(void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //    float maxWidth = 0.0f;
    //    for( NSString* str in data_array ){
    //         CGSize size = [str sizeWithFont: [UIFont systemFontOfSize: [UIFont systemFontSize]]];
    //        if( size.width > maxWidth ){
    //            maxWidth = size.width;
    //        }
    //    }

    float popoverHeight = MIN([_dataArray count] * 44.0f, 300.0f);
    self.contentSizeForViewInPopover = CGSizeMake(self.view.bounds.size.width, popoverHeight);
}

- (void)dealloc {
    [_dataArray release];
    [super dealloc];
}

@end
