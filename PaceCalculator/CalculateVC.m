//
//  CalculateVC.m
//  PaceCalculator
//
//  Created by Spencer Morris on 2/10/15.
//  Copyright (c) 2015 Spencer Morris. All rights reserved.
//

#import "CalculateVC.h"

@interface CalculateVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *paceTextField;
@property (weak, nonatomic) IBOutlet UIButton *distanceCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *timeCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *paceCalculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeUnitSegmentedControl;

@property (strong, nonatomic) NSNumber *distance;
@property (strong, nonatomic) NSNumber *time;
@property (strong, nonatomic) NSNumber *pace;

@end

@implementation CalculateVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupPacePickerView];
}

- (void)setupPacePickerView
{
#warning TODO
}

#pragma mark- Property methods

- (NSNumber *)distance
{
    return nil;
}

- (NSNumber *)time
{
    return nil;
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
        
#warning TODO: check if newString is a number
        return YES;
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

@end
