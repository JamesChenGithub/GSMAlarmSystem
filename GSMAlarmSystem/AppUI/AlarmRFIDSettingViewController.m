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

- (CGFloat)contentHeight
{
    return 355;
}

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_CHANGE_RFID_NAME;
}


- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return kplease_input_rfid_name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)layoutOnIPhone
{
    [self layoutNavHead];
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, [self contentHeight])];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 40)];
    
    [_tableView sizeWith:CGSizeMake(_contentView.bounds.size.width - 30, _contentView.bounds.size.height - 75)];
    [_tableView layoutParentHorizontalCenter];
    [_tableView layoutBelow:_contentTitle margin:5];
}


@end
