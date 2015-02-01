//
//  AlarmPWDSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmPWDSettingViewController.h"

@interface AlarmPWDSettingViewController ()

@end

@implementation AlarmPWDSettingViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
}

- (NSString *)willSendMessageTitle
{
    return kGSM_MC_CHANGE_PWD;
}

- (NSString *)willSendMessage
{
    TextFieldTableViewCell *cell = (TextFieldTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *text = [[cell editText] trim];
    
    
    if ([NSString isEmpty:text])
    {
        return nil;
    }
    else
    {
        if (text.length != 4)
        {
            return nil;
        }
    }
    NSString *msg = [NSString stringWithFormat:@"%@%@", [self willSendMessageTitle], text];
    return msg;
}


- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return kplease_input_pwd;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#if kNeedNavigationBar

#else

- (CGFloat)contentHeight
{
    return 200;
}

#endif
@end
