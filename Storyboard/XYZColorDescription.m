//
//  XYZColorDescription.m
//  Storyboard
//
//  Created by elliott chavis on 12/23/15.
//  Copyright (c) 2015 Robco. All rights reserved.
//

#import "XYZColorDescription.h"

@implementation XYZColorDescription

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
