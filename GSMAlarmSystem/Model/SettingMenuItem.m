//
//  SettingMenuItem.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "SettingMenuItem.h"

@implementation SettingMenuItem

- (UIImage *)icon
{
    if (!_icon)
    {
//        _icon = [UIImage imageWithColor:kRandomFlatColor size:CGSizeMake(40, 40)];
        return [UIImage imageNamed:self.iconName];
    }
    return _icon;
}

- (NSString *)title
{
    return Localized(_title);
}

@end
