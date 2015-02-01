//
//  AlarmLanguageSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmLanguageSettingViewController.h"

@interface AlarmLanguageSettingViewController ()

@end

@implementation AlarmLanguageSettingViewController


- (void)configOwnViews
{
    self.data = [NSMutableArray array];
    
    MainMenuItem *item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_AE;
    item.message = kGSM_MC_LANGUAGE_CN;
    [self.data addObject:item];
    
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_EN;
    item.message = kGSM_MC_LANGUAGE_EN;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_FR;
    item.message = kGSM_MC_LANGUAGE_FR;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_ES;
    item.message = kGSM_MC_LANGUAGE_ES;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_AE;
    item.message = kGSM_MC_LANGUAGE_AE;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_DE;
    item.message = kGSM_MC_LANGUAGE_DE;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_RU;
    item.message = kGSM_MC_LANGUAGE_RU;
    [self.data addObject:item];
    
    item = [[MainMenuItem alloc] init];
    item.title = kLANGUAGE_PT;
    item.message = kGSM_MC_LANGUAGE_PT;
    [self.data addObject:item];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kWTATableCellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"kWTATableCellIdentifier"];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = kBlackColor;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    MainMenuItem *kv = _data[indexPath.row];
    cell.textLabel.text = kv.title;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMenuItem *item = [self.data objectAtIndex:indexPath.row];
    [self sendMessage:item.message];
    
}



@end
