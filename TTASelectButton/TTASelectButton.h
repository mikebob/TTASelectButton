//
//  Created by Michael Bobiney on 5/28/12.
//  Copyright (c) 2012 Tap Through Apps LLC. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TTAPickerViewController.h"

@interface TTASelectButton : UIButton<TTAPickerDelegate>
{ }

@property (retain, nonatomic) UIPopoverController *popover;
@property (retain, nonatomic) NSArray *pickerData;
@property (retain, nonatomic) NSIndexPath *selectedIndexPath;
@property (nonatomic, readonly) NSString *selectedValue;

- (id)initWithFrame:(CGRect)frame andStartingSelectionOrNil:(NSIndexPath *)defaultSelection;
- (void)inputSelectionTapped:(UIButton *)button;

@end
