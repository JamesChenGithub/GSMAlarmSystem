//
//  AlarmRegionSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmRegionSettingViewController.h"

@interface AlarmRegionSettingViewController ()

@end

@implementation AlarmRegionSettingViewController

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_RENAME_ZONE;
}

- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return [NSString stringWithFormat:kzone_name_format, (long)index.row + 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

#define kAlarmRFIDCell @"kAlarmRFIDCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *indentifier = [NSString stringWithFormat:@"kAlarmRFIDCell_%ld", (long)indexPath.row];
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[TextFieldTableViewCell alloc] initWith:nil placeHolder:[self inputPlaceHolder:indexPath] reuseIdentifier:indentifier];
    }
    return cell;
}


@end
