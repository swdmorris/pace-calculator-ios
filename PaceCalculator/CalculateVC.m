//
//  CalculateVC.m
//  PaceCalculator
//
//  Created by Spencer Morris on 2/10/15.
//  Copyright (c) 2015 Spencer Morris. All rights reserved.
//

#import "CalculateVC.h"

@interface CalculateVC ()

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *paceLabel;
@property (weak, nonatomic) IBOutlet UIButton *distanceCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *timeCalculateButton;
@property (weak, nonatomic) IBOutlet UIButton *paceCalculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *distanceUnitSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeUnitSegmentedControl;

@end

@implementation CalculateVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark- Actions

- (IBAction)calculateButtonPressed:(UIButton *)sender
{
    if (sender == self.distanceCalculateButton) {
        
    } else if (sender == self.timeCalculateButton) {
        
    } else if (sender == self.paceCalculateButton) {
        
    }
}

@end
