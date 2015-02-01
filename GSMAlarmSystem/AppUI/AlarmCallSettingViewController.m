//
//  AlarmCallSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmCallSettingViewController.h"

@interface AlarmCallSettingViewController ()

@end

@implementation AlarmCallSettingViewController

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_PHONE_NUM_SETTINGS;
}

- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return kplease_input_phone_number;
}

@end
