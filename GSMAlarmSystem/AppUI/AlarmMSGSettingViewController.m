//
//  AlarmMSGSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmMSGSettingViewController.h"

@interface AlarmMSGSettingViewController ()

@end

@implementation AlarmMSGSettingViewController

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_SMS_NUM_SETTINGS;
}

- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return kplease_input_msg_number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

#if kNeedNavigationBar

#else

- (CGFloat)contentHeight
{
    return 230;
}

#endif
@end
