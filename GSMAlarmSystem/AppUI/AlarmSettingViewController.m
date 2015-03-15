//
//  AlarmSettingViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AlarmSettingViewController.h"

@interface AlarmSettingViewController ()

@end

@implementation AlarmSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kok style:UIBarButtonItemStylePlain target:self action:@selector(onSettingDone)];
}


- (void)onSettingDone
{
    NSString *msg = [self willSendMessage];
    
    if (![NSString isEmpty:msg])
    {
        [self sendMessage:msg];
    }
    else
    {
        [[HUDHelper sharedInstance] tipMessage:kPleaseInputInformation];
    }
}

- (NSString *)willSendMessageTitle
{
    return @"";
}

- (NSString *)willSendMessage
{
    return nil;
}

@end

@implementation AlarmSettingInputViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#if kNeedNavigationBar
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kok style:UIBarButtonItemStylePlain target:self action:@selector(onSettingDone)];
}
#else

- (CGFloat)contentHeight
{
    return 360;
}

- (void)onClickCancel
{
    [[AppDelegate sharedAppDelegate] popViewController];
}

- (void)onClickDone
{
    [self onSettingDone];
}

- (void)layoutOnIPhone
{
    [self layoutNavHead];
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, [self contentHeight])];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 40)];
    
    [_tableView sizeWith:CGSizeMake(_contentView.bounds.size.width - 30, _contentView.bounds.size.height - 45)];
    [_tableView layoutParentHorizontalCenter];
    [_tableView layoutBelow:_contentTitle margin:5];
}

- (void)addOwnViews
{
    [self addTitleViews];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_contentView];
    
    
    _contentTitle = [[UILabel alloc] init];
    _contentTitle.font = kDefaultFont;

    _contentTitle.textColor = kWhiteColor;
    _contentTitle.backgroundColor = RGBOF(0xC4C4C4);
    _contentTitle.textAlignment = NSTextAlignmentCenter;
    _contentTitle.text = self.title;
    [_contentView addSubview:_contentTitle];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 40;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_contentView addSubview:_tableView];
    
}

#endif

- (void)configOwnViews
{
    NSInteger count = [self tableView:_tableView numberOfRowsInSection:0];
    self.data = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++)
    {
        [self.data addObject:[[MenuItem alloc] init]];
    }
}




- (void)onSettingDone
{
    NSString *msg = [self willSendMessage];
    
    if (![NSString isEmpty:msg])
    {
        [self sendMessage:msg];
    }
    else
    {
        [[HUDHelper sharedInstance] tipMessage:kPleaseInputInformation];
    }
}

- (NSString *)willSendMessageTitle
{
    return @"";
}

- (NSString *)willSendMessage
{
    NSInteger num = self.data.count;
    
    NSMutableString *msg = [NSMutableString string];
    
    for (NSInteger i = 0; i < num; i++)
    {
        MenuItem *menu = self.data[i];
        NSString *text = menu.title;
        
        if (![NSString isEmpty:text])
        {
            [msg appendFormat:@"%ld.%@%@", (long)i+1, text, kGSM_MC_LINE];
        }
    }
    
    if ([NSString isEmpty:msg]) {
        return nil;
    }
    
    [msg insertString:[self willSendMessageTitle] atIndex:0];
    return msg;
}

- (NSString *)inputPlaceHolder:(NSIndexPath *)index
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

#define kAlarmRFIDCell @"kAlarmRFIDCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *indentifier = [NSString stringWithFormat:@"kAlarmRFIDCell_%ld", (long)indexPath.row];
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[TextFieldTableViewCell alloc] initWith:nil placeHolder:[self inputPlaceHolder:indexPath] reuseIdentifier:indentifier];
        cell.edit.keyboardType = UIKeyboardTypeNumberPad;
        
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


@implementation AlarmPickerViewController

- (void)addOwnViews
{
#if kNeedNavigationBar
#else
    [self addTitleViews];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_contentView];
    
    _contentTitle = [[UILabel alloc] init];
    _contentTitle.font = kDefaultFont;
    _contentTitle.textColor = kWhiteColor;
    _contentTitle.backgroundColor = RGBOF(0xC4C4C4);
    _contentTitle.textAlignment = NSTextAlignmentCenter;
    _contentTitle.text = self.title;
    [_contentView addSubview:_contentTitle];
#endif
    _picker = [[UIPickerView alloc] init];
    _picker.delegate = self;
    _picker.dataSource = self;
    _picker.backgroundColor = RGBOF(0xC4C4C4);
    [self.view addSubview:_picker];
}

#if kNeedNavigationBar
- (void)layoutOnIPhone
{
    [_picker layoutParentHorizontalCenter];
    [_picker alignParentBottom];
}

#else
- (CGFloat)contentHeight
{
    return 360;
}

- (void)onClickCancel
{
    [[AppDelegate sharedAppDelegate] popViewController];
}

- (void)onClickDone
{
    [self onSettingDone];
}

- (void)layoutOnIPhone
{
    [self layoutNavHead];
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, [self contentHeight])];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 40)];
    
    [_picker layoutParentHorizontalCenter];
    [_picker alignParentBottom];
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
    return [NSString stringWithFormat:@"%ld", (long)row + 1];
}
@end