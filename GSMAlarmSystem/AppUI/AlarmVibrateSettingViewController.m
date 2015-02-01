//
//  AlarmVibrateSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmVibrateSettingViewController.h"

@interface AlarmVibrateSettingViewController ()

@end

@implementation AlarmVibrateSettingViewController

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_RINGING_TIMES;
}

- (NSString *)willSendMessage
{
    NSString *title = [_vibrateCount titleForState:UIControlStateNormal];
    
    if ([NSString isEmpty:title])
    {
        return 0;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:title];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    NSInteger number;
    [scanner scanInteger:&number];
    
    return [NSString stringWithFormat:@"%@%ld", [self willSendMessageTitle], (long)number];
    
}

- (void)addOwnViews
{
#if kNeedNavigationBar
    _vibrateCount = [[UIButton alloc] init];
    _vibrateCount.backgroundColor = RGBOF(0xC4C4C4);
    [_vibrateCount setTitle:[NSString stringWithFormat:@"1%@", ktimes] forState:UIControlStateNormal];
    [_vibrateCount setTitleColor:kBlackColor forState:UIControlStateNormal];
//    [_vibrateCount setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [self.view addSubview:_vibrateCount];
    _vibrateCount.selected = YES;
    _vibrateCount.layer.cornerRadius = 5;
    
    
    [super addOwnViews];
    _picker.showsSelectionIndicator = YES;
#else
    
    [super addOwnViews];
    _picker.showsSelectionIndicator = YES;
    
    _vibrateCount = [[UIButton alloc] init];
    _vibrateCount.backgroundColor = RGBOF(0xC4C4C4);
    [_vibrateCount setTitle:[NSString stringWithFormat:@"1%@", ktimes] forState:UIControlStateNormal];
    [_vibrateCount setTitleColor:kBlackColor forState:UIControlStateNormal];
    //    [_vibrateCount setTitleColor:kWhiteColor forState:UIControlStateSelected];
    [_contentView addSubview:_vibrateCount];
    _vibrateCount.selected = YES;
    _vibrateCount.layer.cornerRadius = 5;
    
#endif
}

#if kNeedNavigationBar
- (void)layoutOnIPhone
{
    [_vibrateCount sizeWith:CGSizeMake(200, 50)];
    [_vibrateCount layoutParentHorizontalCenter];
    [_vibrateCount alignParentTopWithMargin:44];
    
    [super layoutOnIPhone];
}
#else
- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    [_vibrateCount sizeWith:CGSizeMake(200, 50)];
    [_vibrateCount layoutParentHorizontalCenter];
    [_vibrateCount layoutBelow:_contentTitle margin:10];
    
}

#endif

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 9;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *ret =  [NSString stringWithFormat:@"%ld", (long)row + 1];
    return ret;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_vibrateCount setTitle:[NSString stringWithFormat:@"%ld%@", (long)row + 1, ktimes] forState:UIControlStateNormal];
}


@end
