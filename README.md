TTASelectButton
===============

A custom button with a popup text selector


**Example Usage**

```objective-c
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _answers = [[NSArray alloc] initWithObjects: @"Battleship Grey", @"Really long color name here", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Indigo", @"Voilet", nil];
        _selectButton = [[TTASelectButton alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 120.0f, 40.0f)];
        [_selectButton setPickerData:_answers];
        [self.view addSubview:_selectButton];
    }
    return self;
}
```