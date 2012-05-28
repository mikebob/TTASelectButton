//
//  Created by Michael Bobiney on 5/28/12.
//  Copyright (c) 2012 Tap Through Apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTAPickerDelegate;

@protocol TTAPickerDelegate
@required
- (void)pickerItemSelectedAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface TTAPickerViewController : UITableViewController{

}

- (id)initWithStyle:(UITableViewStyle)style;

@property (assign, nonatomic) id<TTAPickerDelegate> delegate;
@property (retain, nonatomic) NSArray *dataArray;

@end