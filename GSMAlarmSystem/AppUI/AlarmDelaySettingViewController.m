//
//  AlarmDelaySettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmDelaySettingViewController.h"

@interface AlarmDelaySettingViewController ()

@end

@implementation AlarmDelaySettingViewController

- (NSString *)willSendMessageTitle
{
    return @"";
}

- (NSString *)willSendMessage
{
    NSString *enterTitle = [_enter titleForState:UIControlStateNormal];
    
    if ([NSString isEmpty:enterTitle])
    {
        return 0;
    }
    
    NSScanner *enterScanner = [NSScanner scannerWithString:enterTitle];
    [enterScanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    NSInteger enter;
    [enterScanner scanInteger:&enter];
    
    
    NSString *exitTitle = [_exit titleForState:UIControlStateNormal];
    
    if ([NSString isEmpty:exitTitle])
    {
        return 0;
    }
    
    NSScanner *exitScanner = [NSScanner scannerWithString:exitTitle];
    [exitScanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    NSInteger exit;
    [exitScanner scanInteger:&exit];
    
    return [NSString stringWithFormat:@"%@%ld%@%@%ld", kGSM_MC_DELAYED_ENTRY, (long)enter, kGSM_MC_LINE, kGSM_MC_DELAYED_EXIT, (long)exit];
    
}
#if kNeedNavigationBar
- (void)addOwnViews
{
    
    _enterTip = [[UILabel alloc] init];
    _enterTip.font = kDefaultFont;
    _enterTip.textAlignment = NSTextAlignmentCenter;
    _enterTip.text = kenter;
    [self.view addSubview:_enterTip];
    
    
    _exitTip = [[UILabel alloc] init];
    _exitTip.font = kDefaultFont;
    _exitTip.textAlignment = NSTextAlignmentCenter;
    _exitTip.text = kexit;
    [self.view addSubview:_exitTip];
    
    _enter = [[UIButton alloc] init];
//    _enter.backgroundColor = RGBOF(0x92D2Df);
    _enter.backgroundColor = kLightGrayColor;
    [_enter setTitle:[NSString stringWithFormat:@"0%@", kmilles] forState:UIControlStateNormal];
    [_enter setTitleColor:kBlackColor forState:UIControlStateNormal];
//    [_enter setTitleColor:kWhiteColor forState:UIControlStateSelected];
//    [_enter addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_enter];
    _enter.layer.cornerRadius = 5;
    
    
    
    _exit = [[UIButton alloc] init];
    _exit.backgroundColor = kLightGrayColor;
    [_exit setTitle:[NSString stringWithFormat:@"0%@", kmilles] forState:UIControlStateNormal];
    [_exit setTitleColor:kBlackColor forState:UIControlStateNormal];
//    [_exit setTitleColor:kWhiteColor forState:UIControlStateSelected];
//    [_exit addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_exit];
    _exit.layer.cornerRadius = 5;
    
    [super addOwnViews];
    
//    [self onSelect:_enter];
}

- (void)layoutOnIPhone
{
    CGSize size = CGSizeMake(120, 50);
    
    [_enterTip sizeWith:size];
    [_enterTip layoutParentHorizontalCenter];
    [_enterTip alignParentTopWithMargin:44];
    [_enterTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_exitTip sameWith:_enterTip];
    [_exitTip layoutToRightOf:_enterTip margin:kDefaultMargin * 2];
    
    [_enter sameWith:_enterTip];
    [_enter layoutBelow:_enterTip margin:kDefaultMargin];
    
    [_exit sameWith:_exitTip];
    [_exit layoutBelow:_exitTip margin:kDefaultMargin];
    
    [super layoutOnIPhone];
    
}

#else
- (void)addOwnViews
{
    [super addOwnViews];
    
    _enterTip = [[UILabel alloc] init];
    _enterTip.font = kDefaultFont;
    _enterTip.textAlignment = NSTextAlignmentCenter;
    _enterTip.text = kenter;
    [_contentView addSubview:_enterTip];
    
    
    _exitTip = [[UILabel alloc] init];
    _exitTip.font = kDefaultFont;
    _exitTip.textAlignment = NSTextAlignmentCenter;
    _exitTip.text = kexit;
    [_contentView addSubview:_exitTip];
    
    _enter = [[UIButton alloc] init];
    //    _enter.backgroundColor = RGBOF(0x92D2Df);
    _enter.backgroundColor = RGBOF(0xC4C4C4);
    [_enter setTitle:[NSString stringWithFormat:@"0%@", kmilles] forState:UIControlStateNormal];
    [_enter setTitleColor:kBlackColor forState:UIControlStateNormal];
        [_enter setTitleColor:kWhiteColor forState:UIControlStateSelected];
        [_enter addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_enter];
    _enter.layer.cornerRadius = 5;
    _enter.titleLabel.font = kDefaultFont;
    
    
    
    _exit = [[UIButton alloc] init];
    _exit.backgroundColor = RGBOF(0xC4C4C4);
    [_exit setTitle:[NSString stringWithFormat:@"0%@", kmilles] forState:UIControlStateNormal];
    [_exit setTitleColor:kBlackColor forState:UIControlStateNormal];
        [_exit setTitleColor:kWhiteColor forState:UIControlStateSelected];
        [_exit addTarget:self action:@selector(onSelect:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_exit];
    _exit.layer.cornerRadius = 5;
    _exit.titleLabel.font = kDefaultFont;
    
    
    
        [self onSelect:_enter];
}

- (void)onSelect:(UIButton *)btn
{
    if (btn == _enter)
    {
        if (_enter.selected)
        {
            return;
        }
        
        _enter.selected = YES;
        _enter.backgroundColor = RGBOF(0x92D2Df);
        _exit.selected = NO;
        _exit.backgroundColor = RGBOF(0xC4C4C4);
    }
    else
    {
        if (_exit.selected)
        {
            return;
        }
        
        _exit.selected = YES;
        _exit.backgroundColor = RGBOF(0x92D2Df);
        _enter.selected = NO;
        _enter.backgroundColor = RGBOF(0xC4C4C4);
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
    
    [_enterTip sizeWith:size];
    [_enterTip layoutParentHorizontalCenter];
    [_enterTip layoutBelow:_contentTitle margin:10];
    [_enterTip move:CGPointMake(-(size.width/2 + kDefaultMargin), 0)];
    
    [_exitTip sameWith:_enterTip];
    [_exitTip layoutToRightOf:_enterTip margin:kDefaultMargin * 2];
    
    [_enter sameWith:_enterTip];
    [_enter layoutBelow:_enterTip margin:kDefaultMargin];
    
    [_exit sameWith:_exitTip];
    [_exit layoutBelow:_exitTip margin:kDefaultMargin];
    
    
    
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
    return 301;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        [_enter setTitle:[NSString stringWithFormat:@"%ld%@", (long)row, kmilles] forState:UIControlStateNormal];
    }
    else
    {
        [_exit setTitle:[NSString stringWithFormat:@"%ld%@", (long)row, kmilles] forState:UIControlStateNormal];
    }
    
}



@end
