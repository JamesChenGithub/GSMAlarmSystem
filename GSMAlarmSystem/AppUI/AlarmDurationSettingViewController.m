//
//  AlarmDurationSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmDurationSettingViewController.h"

@interface AlarmDurationSettingViewController ()

@end

@implementation AlarmDurationSettingViewController

- (NSString *)willSendMessageTitle
{
    return @"";
}

- (NSString *)willSendMessage
{
    NSString *volumeTitle = [_volume titleForState:UIControlStateNormal];
    
    NSInteger volume = 0;
    
    if ([volumeTitle isEqualToString:khigh])
    {
        volume = 1;
    }
    
    NSString *timeTitle = [_time titleForState:UIControlStateNormal];
    
    if ([NSString isEmpty:timeTitle])
    {
        return 0;
    }
    
    NSScanner *timeScaner = [NSScanner scannerWithString:timeTitle];
    [timeScaner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    NSInteger time;
    [timeScaner scanInteger:&time];
    
    return [NSString stringWithFormat:@"%@%ld%@%@%ld", kGSM_MC_VOLUME, (long)volume, kGSM_MC_LINE, kGSM_MC_RINGING_TIME, (long)time];
    
}

#if kNeedNavigationBar
- (void)addOwnViews
{
    _volumeTip = [[UILabel alloc] init];
    _volumeTip.textAlignment = NSTextAlignmentCenter;
    _volumeTip.text = kvolume;
    [self.view addSubview:_volumeTip];
    
    
    _timeTip = [[UILabel alloc] init];
    _timeTip.textAlignment = NSTextAlignmentCenter;
    _timeTip.text = ktime;
    [self.view addSubview:_timeTip];
    
    _volume = [[UIButton alloc] init];
    _volume.backgroundColor = RGBOF(0xC4C4C4);;
    [_volume setTitle:kmute forState:UIControlStateNormal];
    [_volume setTitleColor:kBlackColor forState:UIControlStateNormal];
    //    [_volume setTitleColor:kWhiteColor forState:UIControlStateSelected];
    //    [_volume addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_volume];
    _volume.layer.cornerRadius = 5;
    
    
    
    _time = [[UIButton alloc] init];
    _time.backgroundColor = RGBOF(0xC4C4C4);
    [_time setTitle:[NSString stringWithFormat:@"3%@", kseconds] forState:UIControlStateNormal];
    [_time setTitleColor:kBlackColor forState:UIControlStateNormal];
    //    [_time setTitleColor:kWhiteColor forState:UIControlStateSelected];
    //    [_time addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_time];
    _time.layer.cornerRadius = 5;
    
    [super addOwnViews];
    
    //    [self onSelect:_volume];
    
    [_picker selectRow:2 inComponent:1 animated:YES];
}

- (void)layoutOnIPhone
{
    CGSize size = CGSizeMake(120, 50);
    
    [_volumeTip sizeWith:size];
    [_volumeTip layoutParentHorizontalCenter];
    [_volumeTip alignParentTopWithMargin:44];
    [_volumeTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_timeTip sameWith:_volumeTip];
    [_timeTip layoutToRightOf:_volumeTip margin:kDefaultMargin * 2];
    
    [_volume sameWith:_volumeTip];
    [_volume layoutBelow:_volumeTip margin:kDefaultMargin];
    
    [_time sameWith:_timeTip];
    [_time layoutBelow:_timeTip margin:kDefaultMargin];
    
    [super layoutOnIPhone];
    
}
#else

- (void)addOwnViews
{
    [super addOwnViews];
    
    _volumeTip = [[UILabel alloc] init];
    _volumeTip.font = kDefaultFont;
    _volumeTip.textAlignment = NSTextAlignmentCenter;
    _volumeTip.text = kvolume;
    [_contentView addSubview:_volumeTip];
    
    
    _timeTip = [[UILabel alloc] init];
    _timeTip.font = kDefaultFont;
    _timeTip.textAlignment = NSTextAlignmentCenter;
    _timeTip.text = ktime;
    [_contentView addSubview:_timeTip];
    
    _volume = [[UIButton alloc] init];
    _volume.backgroundColor = RGBOF(0xC4C4C4);
    [_volume setTitle:@"0" forState:UIControlStateNormal];
    [_volume setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_volume setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_volume addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_volume];
    _volume.layer.cornerRadius = 5;
    _volume.titleLabel.font = kDefaultFont;
    
    
    
    _time = [[UIButton alloc] init];
    _time.backgroundColor = RGBOF(0xC4C4C4);
    [_time setTitle:[NSString stringWithFormat:@"3%@", kseconds] forState:UIControlStateNormal];
    [_time setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_time setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_time addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_time];
    _time.layer.cornerRadius = 5;
    _time.titleLabel.font = kDefaultFont;
    
    [self onSelect:_volume];
    
    [_picker selectRow:2 inComponent:1 animated:YES];
}

- (void)onSelect:(UIButton *)btn
{
    if (btn == _volume)
    {
        if (_volume.selected)
        {
            return;
        }
        
        _volume.selected = YES;
        _volume.backgroundColor = RGBOF(0x92D2Df);
        _time.selected = NO;
        _time.backgroundColor = kLightGrayColor;
    }
    else
    {
        if (_time.selected)
        {
            return;
        }
        
        _time.selected = YES;
        _time.backgroundColor = RGBOF(0x92D2Df);
        _volume.selected = NO;
        _volume.backgroundColor = kLightGrayColor;
    }
}

- (CGFloat)contentHeight
{
    return 230;
}

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    
    CGSize size = CGSizeMake(120, 40);
    
    [_volumeTip sizeWith:size];
    [_volumeTip layoutParentHorizontalCenter];
    [_volumeTip layoutBelow:_contentTitle margin:10];
    [_volumeTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_timeTip sameWith:_volumeTip];
    [_timeTip layoutToRightOf:_volumeTip margin:kDefaultMargin * 2];
    
    [_volume sameWith:_volumeTip];
    [_volume layoutBelow:_volumeTip margin:kDefaultMargin];
    
    [_time sameWith:_timeTip];
    [_time layoutBelow:_timeTip margin:kDefaultMargin];
    
    
    
}

#endif

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 6;
    }
    else
    {
        return 9;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        //        if (row == 0)
        //        {
        //            return kmute;
        //        }
        //        else
        //        {
        //            return khigh;
        //        }
        return [NSString stringWithFormat:@"%ld", (long)row];
    }
    else
    {
        return [NSString stringWithFormat:@"%ld", (long)row+1];
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
        [_volume setTitle:title forState:UIControlStateNormal];
    }
    else
    {
        [_time setTitle:[NSString stringWithFormat:@"%ld%@", (long)row+1, kseconds] forState:UIControlStateNormal];
    }
    
}

@end
