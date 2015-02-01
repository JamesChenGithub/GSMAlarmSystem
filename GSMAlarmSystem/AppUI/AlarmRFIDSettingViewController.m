//
//  AlarmRFIDSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmRFIDSettingViewController.h"

@interface AlarmRFIDSettingViewController ()

@end

@implementation AlarmRFIDSettingViewController

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_CHANGE_RFID_NAME;
}


- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return kplease_input_rfid_name;
}



@end
