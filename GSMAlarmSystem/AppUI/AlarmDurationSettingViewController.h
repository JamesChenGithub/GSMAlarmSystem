//
//  AlarmDurationSettingViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AlarmDurationSettingViewController : AlarmPickerViewController
{
    UILabel     *_volumeTip;
    UIButton    *_volume;
    
    UILabel     *_timeTip;
    UIButton    *_time;
}
@end
