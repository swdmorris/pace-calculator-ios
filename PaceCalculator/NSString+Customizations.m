//
//  NSString+Customizations.m
//  PaceCalculator
//
//  Created by Spencer Morris on 2/12/15.
//  Copyright (c) 2015 Spencer Morris. All rights reserved.
//

#import "NSString+Customizations.h"

@implementation NSString (Customizations)

- (NSNumber *)numberValue
{
    return [[NSNumberFormatter new] numberFromString:self];
}

@end
