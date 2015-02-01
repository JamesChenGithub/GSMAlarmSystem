//
//  AlarmDelaySettingViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AlarmDelaySettingViewController : AlarmPickerViewController
{
    UILabel     *_enterTip;
    UIButton    *_enter;
    
    UILabel     *_exitTip;
    UIButton    *_exit;
}

@end
