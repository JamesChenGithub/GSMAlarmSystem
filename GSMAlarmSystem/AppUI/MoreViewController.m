//
//  MoreViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MoreViewController.h"

@implementation MoreViewController

- (void)addOwnViews
{
    _version = [[UILabel alloc] init];
    _version.textAlignment = NSTextAlignmentCenter;
    _version.text = kapp_name;
    [self.view addSubview:_version];
}

- (void)layoutOnIPhone
{
    _version.frame = self.view.bounds;
}

@end
