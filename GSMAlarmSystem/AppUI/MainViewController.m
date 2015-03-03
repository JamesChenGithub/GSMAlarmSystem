//
//  MainViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MainViewController.h"




@implementation MSGMenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = kWhiteColor;
        [self addSubview:_bottomLine];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

- (void)relayoutFrameOfSubViews
{
    self.imageView.frame = CGRectFromCGSize(CGSizeMake(40, 40));
    [self.imageView layoutParentCenter];
    
    [_bottomLine sizeWith:CGSizeMake(self.bounds.size.width - 10, 2)];
    [_bottomLine layoutParentHorizontalCenter];
    [_bottomLine alignParentBottom];
    _bottomLine.layer.cornerRadius = 1;
}


@end



@implementation MainViewController

- (MSGMenuButton *)create:(MainMenuItem *)item
{
    MSGMenuButton *btn = [[MSGMenuButton alloc] init];
    
    UIImage *icon = [item icon];

    [btn setImage:icon forState:UIControlStateNormal];
    
    UIImage *ng = [UIImage imageWithColor:RGBOF(0xC4C4C4)];
    UIImage *bg = [UIImage imageWithColor:RGBOF(0x92D2DF)];
    [btn setBackgroundImage:ng forState:UIControlStateNormal];
    [btn setBackgroundImage:bg forState:UIControlStateSelected];
    [btn setBackgroundImage:bg forState:UIControlStateHighlighted];

    
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.menu = item;
    [self.view addSubview:btn];
    
    
    return btn;
}

- (void)onClick:(MSGMenuButton *)btn
{
    [self sendMessage:btn.menu.message];
    
    if(btn == _alarm)
    {
        _alarm.selected = !_alarm.selected;
        _alarm.menu.message = _alarm.selected ? kGSM_MC_MSG_OFF : kGSM_MC_MSG_ON;
    }
    
}

- (BOOL)hasBackgroundView
{
    return YES;
}

- (void)configBackground
{
    [super configBackground];
    _backgroundView.image = [UIImage imageNamed:@"tab_menu_bg"];
//    _backgroundView.contentMode = UIViewContentModeBottom;
//    _backgroundView.backgroundColor = kClearColor;
}

- (void)addOwnViews
{
    _lock = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_DEPLOYMENT icon:[UIImage imageNamed:@"deployment"] action:nil]];
    
    _unlock = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_DEPLOYMENT icon:[UIImage imageNamed:@"abandon"] action:nil]];
    
    _speaker = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_TAKE_MSG icon:[UIImage imageNamed:@"msg"] action:nil]];
    _home = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_HOME icon:[UIImage imageNamed:@"home"] action:nil]];
    _sos = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_SOS icon:[UIImage imageNamed:@"SOS"] action:nil]];
    
    _msg = [self create:[[MainMenuItem alloc] initWithMsg:nil icon:[UIImage imageNamed:@"duanx"] action:nil]];
    _down = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_QUERY icon:[UIImage imageNamed:@"qurey"] action:nil]];
    
    _alarm = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_SPEAKER_ON icon:[UIImage imageNamed:@"speaker"] action:nil]];
    [_alarm setImage:[UIImage imageNamed:@"speaker off"] forState:UIControlStateSelected];
    
    _callin = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_TALK icon:[UIImage imageNamed:@"talk"] action:nil]];
    _callout = [self create:[[MainMenuItem alloc] initWithMsg:kGSM_MC_MONITOR icon:[UIImage imageNamed:@"remute"] action:nil]];
}
#if kNeedNavigationBar
- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    
    [_lock sizeWith:CGSizeMake((rect.size.width - kDefaultMargin)/2, 80)];
    [_lock alignParentTopWithMargin:kDefaultMargin];
    [_lock alignParentLeftWithMargin:kDefaultMargin];
    
    [_unlock sameWith:_lock];
    [_unlock layoutToRightOf:_lock margin:kDefaultMargin];
    
    
    [_speaker sizeWith:CGSizeMake((rect.size.width - 4 * kDefaultMargin)/3, 80)];
    [_speaker alignParentLeftWithMargin:kDefaultMargin];
    [_speaker layoutBelow:_lock margin:kDefaultMargin];
    
    [_home sameWith:_speaker];
    [_home layoutToRightOf:_speaker margin:kDefaultMargin];
    
    [_sos sameWith:_home];
    [_sos layoutToRightOf:_home margin:kDefaultMargin];
    
    [_msg sameWith:_speaker];
    [_msg layoutBelow:_speaker margin:kDefaultMargin];
    
    [_down sameWith:_home];
    [_down layoutBelow:_home margin:kDefaultMargin];
    
    [_alarm sameWith:_sos];
    [_alarm layoutBelow:_sos margin:kDefaultMargin];
    
    [_callin sameWith:_lock];
    [_callin layoutBelow:_msg margin:kDefaultMargin];
    
    [_callout sameWith:_unlock];
    [_callout layoutBelow:_alarm margin:kDefaultMargin];
    
    
}

#else

#define kHorMargin 0
#define kVerMargin 0

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    
    [_lock sizeWith:CGSizeMake((rect.size.width - 0 * kHorMargin)/2, 80)];
    [_lock alignParentTopWithMargin:kVerMargin];
    [_lock alignParentLeftWithMargin:kHorMargin];
    
    [_unlock sameWith:_lock];
    [_unlock layoutToRightOf:_lock margin:kHorMargin];
    
    
    [_speaker sizeWith:CGSizeMake((rect.size.width - 0 * kHorMargin)/3, 80)];
    [_speaker alignParentLeftWithMargin:kHorMargin];
    [_speaker layoutBelow:_lock margin:kVerMargin];
    
    [_home sameWith:_speaker];
    [_home layoutToRightOf:_speaker margin:kHorMargin];
    
    [_sos sameWith:_home];
    [_sos layoutToRightOf:_home margin:kHorMargin];
    
    [_msg sameWith:_speaker];
    [_msg layoutBelow:_speaker margin:kVerMargin];
    
    [_down sameWith:_home];
    [_down layoutBelow:_home margin:kVerMargin];
    
    [_alarm sameWith:_sos];
    [_alarm layoutBelow:_sos margin:kVerMargin];
    
    [_callin sameWith:_lock];
    [_callin layoutBelow:_msg margin:kVerMargin];
    
    [_callout sameWith:_unlock];
    [_callout layoutBelow:_alarm margin:kVerMargin];
    
    
}
#endif

@end
