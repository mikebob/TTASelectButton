//
//  Created by Michael Bobiney on 5/28/12.
//  Copyright (c) 2012 Tap Through Apps LLC. All rights reserved.
//

#import "TTASelectButton.h"

@interface TTASelectButton ()
    -(void)resizeButton;
@end

@implementation TTASelectButton {
    NSArray *_answers;
    TTAPickerViewController * _pickerViewController;
}

@synthesize popover = _popover;
@synthesize pickerData = _pickerData;
@synthesize selectedIndexPath = _selectedIndexPath;
@synthesize selectedValue = _selectedValue;

#pragma mark - == Constructors ====== -

- (id)initWithFrame:(CGRect)frame andStartingSelectionOrNil:(NSIndexPath *)defaultSelection
{
    self = [super initWithFrame:frame];
    if (self) {
        _pickerViewController = [[TTAPickerViewController alloc] initWithStyle: UITableViewStylePlain];
        _pickerViewController.delegate = self;
        _popover = [[UIPopoverController alloc] initWithContentViewController:_pickerViewController];
        _selectedIndexPath = defaultSelection ? defaultSelection : nil;

        [self setTitle:@"Tap to Select" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(inputSelectionTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame andStartingSelectionOrNil:nil];
}

#pragma mark - == Setters ========== -

-(void)setPickerData:(NSArray *)valueArray {
    _answers = valueArray;
    [_pickerViewController setDataArray:_answers];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self resizeButton];
}

#pragma mark - == Events ========== -

- (void)inputSelectionTapped:(UIButton*)button {

    if ([self.popover isPopoverVisible]) {
        [self.popover dismissPopoverAnimated:YES];
    }

    [self.popover setPopoverContentSize: _pickerViewController.contentSizeForViewInPopover];
    [self.popover presentPopoverFromRect:self.bounds inView:self permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(NSString *)selectedValue {
    return [_answers objectAtIndex:_selectedIndexPath.row];
}

-(void)resizeButton {
    CGSize size = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    float width = MAX(size.width + 30, 200);
    self.frame = (CGRect) { self.frame.origin, width, self.frame.size.height };
    [self setNeedsDisplay];
}

- (void)pickerItemSelectedAtIndexPath:(NSIndexPath *)indexPath {

    NSString *title = [_answers objectAtIndex:indexPath.row];
    [self setTitle:title forState:UIControlStateNormal];
    [self.popover dismissPopoverAnimated:YES];
    self.selectedIndexPath = indexPath;
    [self resizeButton]; 
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat gradientLocations[] = {0, 0, 0.85};

    CGFloat colors[12] = {
            1.0f, 1.0f, 1.0f, 1.0f, // white
            0.5f, 0.5f, 0.5f, 1.0f, // light gray
            0.0f, 0.0f, 0.0f, 1.0f  // black
    };

    int locLength = sizeof(gradientLocations)/sizeof(CGFloat);
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, gradientLocations, locLength);

    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: 10];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(self.bounds.size.width / 2, -0), CGPointMake(self.bounds.size.width / 2, self.bounds.size.height), 0);
    CGContextRestoreGState(context);

    [[UIColor blackColor] setStroke];
    roundedRectanglePath.lineWidth = 0.5;
    [roundedRectanglePath stroke];

    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)dealloc {
    [_answers release];
    [_pickerViewController release];
    [_popover release];
    [_selectedIndexPath release];
    [_pickerData release];
    [super dealloc];
}


@end
