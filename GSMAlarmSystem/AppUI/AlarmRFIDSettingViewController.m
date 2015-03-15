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
    return 7;
}

#define kAlarmRFIDCell @"kAlarmRFIDCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *indentifier = [NSString stringWithFormat:@"kAlarmRFIDCell_%ld", (long)indexPath.row];
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[TextFieldTableViewCell alloc] initWith:nil placeHolder:[self inputPlaceHolder:indexPath] reuseIdentifier:indentifier];
        
        __weak typeof(tableView) wt = tableView;
        cell.nextAction = ^(TextFieldTableViewCell *curcell) {
            NSIndexPath *path = [wt indexPathForCell:curcell];
            NSIndexPath *nextPath = [NSIndexPath indexPathForRow:path.row + 1 inSection:path.section];
            [wt scrollToRowAtIndexPath:nextPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
            TextFieldTableViewCell *nextCell = (TextFieldTableViewCell *)[wt cellForRowAtIndexPath:nextPath];

//            CGFloat rowheight = 100;
//            if (abs(wt.contentOffset.y + wt.bounds.size.height - wt.contentSize.height) < rowheight)
//            {
//                wt.contentOffset = CGPointMake(wt.contentOffset.x, wt.contentOffset.y + 2 * rowheight);
//            }
            [nextCell.edit becomeFirstResponder];
        };
        
    }
    
    if (indexPath.row == [self tableView:tableView numberOfRowsInSection:0]-1)
    {
        cell.edit.returnKeyType = UIReturnKeyDone;
    }
    else
    {
        cell.edit.returnKeyType = UIReturnKeyNext;
    }
    
    
    cell.menu = [self.data objectAtIndex:indexPath.row];
    return cell;
}


@end
