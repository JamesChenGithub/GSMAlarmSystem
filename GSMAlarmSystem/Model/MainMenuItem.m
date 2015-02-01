//
//  MainMenuItem.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MainMenuItem.h"

@implementation MainMenuItem

- (instancetype)initWithMsg:(NSString *)msg icon:(UIImage *)icon action:(MenuAction)action;
{
    if (self = [super initWithTitle:nil icon:icon action:action]) {
        self.message = msg;
    }
    return self;
}

- (UIImage *)icon
{
    if (!_icon)
    {
        _icon = [UIImage imageWithColor:[UIColor randomFlatLightColor] size:CGSizeMake(40, 40)];
        //        return [UIImage imageNamed:self.iconName];
    }
    return _icon;
}

@end
