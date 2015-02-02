//
//  SettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "SettingViewController.h"


@interface SettingTableViewCell : UITableViewCell

@end

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = RGBOF(0xC4C4C4);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 8;
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
    CGRect rect = self.contentView.bounds;
    self.imageView.frame = CGRectMake(8, 0, 40, 40);
    [self.imageView layoutParentVerticalCenter];
    
    self.textLabel.frame = CGRectMake(56, 0, rect.size.width - 56, rect.size.height);
    [self.textLabel layoutParentVerticalCenter];
    
//    self.layer.cornerRadius = 8;
}

@end

@implementation SettingViewController

#define kSettingPreferenceFile @"SettingPreference.plist"

- (void)addOwnViews
{
    [super addOwnViews];
    _tableView.backgroundColor = kClearColor;
    _tableView.backgroundView.backgroundColor = kClearColor;
    
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorInset = UIEdgeInsetsZero;
}

- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    _tableView.frame = CGRectInset(rect, 10, 0);
}

- (void)configOwnViews
{
    NSString *path = [PathUtility getFileResourcePath:kSettingPreferenceFile];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.data = [NSObject loadItem:[SettingMenuItem class] fromArrayDictionary:array];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"  ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#define kMainTableCellIdentifier @"kMainTableCellIdentifier"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableCellIdentifier];
    if (!cell)
    {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMainTableCellIdentifier];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = kBlackColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = kDefaultFont;
    }
    
    MenuItem *kv = _data[indexPath.section];
    cell.imageView.image = kv.icon;
    cell.textLabel.text = [kv title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingMenuItem *kv = _data[indexPath.section];
    
    Class cls = NSClassFromString(kv.nextHandler);
    if (cls)
    {
        BaseViewController *vc = [[cls alloc] init];
        vc.title = kv.title;
        
        [[AppDelegate sharedAppDelegate] pushViewController:vc];
    }
    
    
}

@end
