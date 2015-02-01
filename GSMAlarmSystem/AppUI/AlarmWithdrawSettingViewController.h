//
//  AlarmWithdrawSettingViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AlarmWithdrawSettingViewController : AlarmSettingViewController
{
    
#if kNeedNavigationBar
#else
    UIView      *_contentView;
    UILabel     *_contentTitle;
#endif
    
    UILabel     *_setAlarmTip;
    UIButton    *_setAlarm;
    
    UILabel     *_withdrawTip;
    UIButton    *_withdraw;
    
    UIDatePicker *_picker;
    
}


#if kNeedNavigationBar
#else
- (CGFloat)contentHeight;
#endif

@end
