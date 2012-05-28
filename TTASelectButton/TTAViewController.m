//
//  Created by Mike Bobiney on 5/28/12.
//  Copyright (c) 2012 Tap Through Apps LLC. All rights reserved.
//

#import "TTAViewController.h"
#import "TTASelectButton.h"

@interface TTAViewController ()

@end

@implementation TTAViewController {
    TTASelectButton *_selectButton;
    NSArray *_answers;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _selectButton = [[TTASelectButton alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 120.0f, 40.0f)];
        _answers = [[NSArray alloc] initWithObjects: @"Battleship Grey", @"Really long color name name name", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Indigo", @"Voilet", nil];
        [_selectButton setPickerData:_answers];
        [self.view addSubview:_selectButton];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)dealloc {
    [_selectButton release];
    [_answers release];
    [super dealloc];
}

@end
