//
//  AlarmWithdrawSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmWithdrawSettingViewController.h"

@interface AlarmWithdrawSettingViewController ()

@end

@implementation AlarmWithdrawSettingViewController


- (NSString *)willSendMessageTitle
{
    return kGSM_MC_ARM_DISARM_TIME;
}

- (NSString *)willSendMessage
{
    NSString *start = [_setAlarm titleForState:UIControlStateNormal];
    NSString *end = [_withdraw titleForState:UIControlStateNormal];
    
    return [NSString stringWithFormat:@"%@%@    %@", [self willSendMessageTitle], start, end];
    
}

#if kNeedNavigationBar
- (void)addOwnViews
{
    _setAlarmTip = [[UILabel alloc] init];
    _setAlarmTip.textAlignment = NSTextAlignmentCenter;
    _setAlarmTip.text = kdeployment_time;
    [self.view addSubview:_setAlarmTip];
    
    
    _withdrawTip = [[UILabel alloc] init];
    _withdrawTip.textAlignment = NSTextAlignmentCenter;
    _withdrawTip.text = kabandon_time;
    [self.view addSubview:_withdrawTip];
    
    _setAlarm = [[UIButton alloc] init];
    _setAlarm.backgroundColor = RGBOF(0x92D2Df);
    [_setAlarm setTitle:@"00:00" forState:UIControlStateNormal];
    [_setAlarm setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_setAlarm setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_setAlarm addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_setAlarm];
    _setAlarm.layer.cornerRadius = 5;
    
    
    
    _withdraw = [[UIButton alloc] init];
    _withdraw.backgroundColor = kLightGrayColor;
    [_withdraw setTitle:@"00:00" forState:UIControlStateNormal];
    [_withdraw setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_withdraw setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_withdraw addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_withdraw];
    _withdraw.layer.cornerRadius = 5;
    
    _picker = [[UIDatePicker alloc] init];
    _picker.datePickerMode = UIDatePickerModeTime;
    _picker.backgroundColor = [UIColor flatWhiteColor];
    [self.view addSubview:_picker];
    
    [_picker addTarget:self action:@selector(onTimeValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    [self onSelect:_setAlarm];
}

- (void)layoutOnIPhone
{
    CGSize size = CGSizeMake(120, 50);
    
    [_setAlarmTip sizeWith:size];
    [_setAlarmTip layoutParentHorizontalCenter];
    [_setAlarmTip alignParentTopWithMargin:44];
    [_setAlarmTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_withdrawTip sameWith:_setAlarmTip];
    [_withdrawTip layoutToRightOf:_setAlarmTip margin:kDefaultMargin * 2];
    
    [_setAlarm sameWith:_setAlarmTip];
    [_setAlarm layoutBelow:_setAlarmTip margin:kDefaultMargin];
    
    [_withdraw sameWith:_withdrawTip];
    [_withdraw layoutBelow:_withdrawTip margin:kDefaultMargin];
    
    [_picker layoutParentHorizontalCenter];
    [_picker alignParentBottom];
    
}


#else

- (void)addOwnViews
{
    
    [self addTitleViews];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_contentView];
    
    
    _contentTitle = [[UILabel alloc] init];
    _contentTitle.textColor = [UIColor flatBlueColor];
    _contentTitle.backgroundColor = RGBOF(0xC4C4C4);
    _contentTitle.textAlignment = NSTextAlignmentCenter;
    _contentTitle.text = self.title;
    [_contentView addSubview:_contentTitle];
    
    
    _setAlarmTip = [[UILabel alloc] init];
    _setAlarmTip.textAlignment = NSTextAlignmentCenter;
    _setAlarmTip.text = kdeployment_time;
    [_contentView addSubview:_setAlarmTip];
    
    
    _withdrawTip = [[UILabel alloc] init];
    _withdrawTip.textAlignment = NSTextAlignmentCenter;
    _withdrawTip.text = kabandon_time;
    [_contentView addSubview:_withdrawTip];
    
    _setAlarm = [[UIButton alloc] init];
    _setAlarm.backgroundColor = RGBOF(0x92D2Df);
    [_setAlarm setTitle:@"00:00" forState:UIControlStateNormal];
    [_setAlarm setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_setAlarm setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_setAlarm addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_setAlarm];
    _setAlarm.layer.cornerRadius = 5;
    
    
    
    _withdraw = [[UIButton alloc] init];
    _withdraw.backgroundColor = kLightGrayColor;
    [_withdraw setTitle:@"00:00" forState:UIControlStateNormal];
    [_withdraw setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_withdraw setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_withdraw addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_withdraw];
    _withdraw.layer.cornerRadius = 5;
    
    _picker = [[UIDatePicker alloc] init];
    _picker.datePickerMode = UIDatePickerModeTime;
    _picker.backgroundColor = RGBOF(0xC4C4C4);
    [self.view addSubview:_picker];
    
    [_picker addTarget:self action:@selector(onTimeValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    [self onSelect:_setAlarm];
}

- (void)layoutOnIPhone
{
    [self layoutNavHead];
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, [self contentHeight])];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 30)];
    
    CGSize size = CGSizeMake(120, 50);
    
    [_setAlarmTip sizeWith:size];
    [_setAlarmTip layoutParentHorizontalCenter];
    [_setAlarmTip alignParentTopWithMargin:44];
    [_setAlarmTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_withdrawTip sameWith:_setAlarmTip];
    [_withdrawTip layoutToRightOf:_setAlarmTip margin:kDefaultMargin * 2];
    
    [_setAlarm sameWith:_setAlarmTip];
    [_setAlarm layoutBelow:_setAlarmTip margin:kDefaultMargin];
    
    [_withdraw sameWith:_withdrawTip];
    [_withdraw layoutBelow:_withdrawTip margin:kDefaultMargin];
    
    [_picker layoutParentHorizontalCenter];
    [_picker alignParentBottom];
    
}

- (CGFloat)contentHeight
{
    return 200;
}
#endif

- (void)onTimeValueChanged:(UIDatePicker *)picker
{
    UIButton *btn = _setAlarm.selected ? _setAlarm : _withdraw;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    
    NSString *time = [dateFormat stringFromDate:picker.date];
    [btn setTitle:time forState:UIControlStateNormal];
}

- (void)onSelect:(UIButton *)btn
{
    
    
    if (btn == _setAlarm)
    {
        if (_setAlarm.selected)
        {
            return;
        }
        
        _setAlarm.selected = YES;
        _setAlarm.backgroundColor = RGBOF(0x92D2Df);
        _withdraw.selected = NO;
        _withdraw.backgroundColor = kLightGrayColor;
    }
    else
    {
        if (_withdraw.selected)
        {
            return;
        }
        
        _withdraw.selected = YES;
        _withdraw.backgroundColor = RGBOF(0x92D2Df);
        _setAlarm.selected = NO;
        _setAlarm.backgroundColor = kLightGrayColor;
    }
    
    NSString *title = [btn titleForState:UIControlStateNormal];
    NSDateFormatter *nowDateFormat = [[NSDateFormatter alloc] init];
    [nowDateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSString *now = [nowDateFormat stringFromDate:[NSDate date]];
    
    NSString *fromTimeStr = [NSString stringWithFormat:@"%@ %@", now, title];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    _picker.date = [dateFormat dateFromString:fromTimeStr];
}



@end
