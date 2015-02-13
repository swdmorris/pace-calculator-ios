//
//  CalculateVC.m
//  PaceCalculator
//
//  Created by Spencer Morris on 2/10/15.
//  Copyright (c) 2015 Spencer Morris. All rights reserved.
//

#import "CalculateVC.h"
#import "NSString+Customizations.h"

#define kHours @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10]
#define kMinutes @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29, @30, @31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41, @42, @43, @44, @45, @46, @47, @48, @49, @50, @51, @52, @53, @54, @55, @56, @57, @58, @59]
#define kSeconds @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28, @29, @30, @31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41, @42, @43, @44, @45, @46, @47, @48, @49, @50, @51, @52, @53, @54, @55, @56, @57, @58, @59]

@interface CalculateVC () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *paceTextField;
@property (weak, nonatomic) IBOutlet UIButton *distanceCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *timeCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *paceCalculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitSegmentedControl;

@property (strong, nonatomic) UIPickerView *timePickerView;
@property (strong, nonatomic) UIDatePicker *pacePickerView;

@property (strong, nonatomic) NSNumber *distance;
@property (strong, nonatomic) NSNumber *time;
@property (strong, nonatomic) NSNumber *pace;

@end

@implementation CalculateVC

@synthesize distance = _distance, time = _time, pace = _pace;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupPacePickerView];
}

- (void)setupPacePickerView
{
    self.timePickerView = [[UIPickerView alloc] init];
    self.timePickerView.delegate = self;
    self.timePickerView.dataSource = self;
    self.timeTextField.inputAccessoryView = self.timePickerView;
    
    self.pacePickerView = [UIDatePicker new];
    self.pacePickerView.datePickerMode = UIDatePickerModeCountDownTimer;
//    self.pacePickerView.delegate = self;
//    self.pacePickerView.dataSource = self;
    self.paceTextField.inputAccessoryView = self.pacePickerView;
    
    UIDatePicker *datePicker = [UIDatePicker new];
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
}

- (void)setupOutlets
{
    
}

#pragma mark- Property methods

- (void)setDistance:(NSNumber *)distance
{
    _distance = distance;
    self.distanceTextField.text = _distance.stringValue;
}

- (NSNumber *)distance
{
    return nil;
}

- (void)setTime:(NSNumber *)time
{
    _time = time;
    self.timeTextField.text = _time.stringValue;
}

- (NSNumber *)time
{
    return nil;
}

- (void)setPace:(NSNumber *)pace
{
    _pace = pace;
    self.paceTextField.text = _pace.stringValue;
}

- (NSNumber *)pace
{
    return nil;
}

#pragma mark- UITextField delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.paceTextField) {
        return YES; // pace set by picker view; no need to check format
    } else {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        return [newString numberValue]; // returns YES if string is valid number
    }
}

#pragma mark- UIPickerView datasouce/delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView == self.timePickerView) {
        return 3;
    } else if (pickerView == self.pacePickerView) {
        return 2;
    } else {
        return 0;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.timePickerView) {
        if (component == 0) {
            return kHours.count;
        } else if (component == 1) {
            return kMinutes.count;
        } else {
            return kSeconds.count;
        }
    } else if (pickerView == self.pacePickerView) {
        if (component == 0) {
            return kMinutes.count;
        } else {
            return kSeconds.count;
        }
    } else {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.timePickerView) {
        if (component == 0) {
            return [NSString stringWithFormat:@"%@", kHours[row]];
        } else if (component == 1) {
            return [NSString stringWithFormat:@"%@", kMinutes[row]];
        } else {
            return [NSString stringWithFormat:@"%@", kSeconds[row]];
        }
    } else if (pickerView == self.pacePickerView) {
        if (component == 0) {
            return [NSString stringWithFormat:@"%@", kMinutes[row]];
        } else {
            return [NSString stringWithFormat:@"%@", kSeconds[row]];
        }
    } else {
        return @"";
    }
}

#pragma mark- Actions

- (IBAction)calculateButtonPressed:(UIButton *)sender
{
    if (sender == self.distanceCalculateButton) {
        self.distance = [NSNumber numberWithDouble:(self.time.doubleValue / self.pace.doubleValue)];
    } else if (sender == self.timeCalculateButton) {
        self.time = [NSNumber numberWithDouble:(self.distance.doubleValue / self.pace.doubleValue)];
    } else if (sender == self.paceCalculateButton) {
        self.pace = [NSNumber numberWithDouble:(self.time.doubleValue / self.distance.doubleValue)];
    }
}

#pragma mark- End of lifecycle methods

- (void)dealloc
{
    self.timePickerView.delegate = nil;
    self.timePickerView.dataSource = nil;
    self.timePickerView = nil;
//    self.pacePickerView.delegate = nil;
//    self.pacePickerView.dataSource = nil;
    self.pacePickerView = nil;
}

@end
