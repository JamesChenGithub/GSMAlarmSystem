//
//  MainViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface MSGMenuButton : MenuButton
{
    UIView *_bottomLine;
}

@property (nonatomic, strong) MainMenuItem *menu;

@end

@interface MainViewController : BaseViewController
{
    MSGMenuButton *_lock;
    MSGMenuButton *_unlock;
    
    MSGMenuButton *_speaker;
    MSGMenuButton *_home;
    MSGMenuButton *_sos;
    
    MSGMenuButton *_msg;
    MSGMenuButton *_down;
    MSGMenuButton *_alarm;
    
    MSGMenuButton *_callin;
    MSGMenuButton *_callout;
}

@end
