//
//  AlarmSettingViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AlarmSettingViewController : BaseViewController

- (void)onSettingDone;

- (NSString *)willSendMessageTitle;

- (NSString *)willSendMessage;

@end

@interface AlarmSettingInputViewController : KeyValueTableViewController
#if kNeedNavigationBar
#else
{
    UIView      *_contentView;
    UILabel     *_contentTitle;
    
}

- (CGFloat)contentHeight;
#endif
- (NSString *)inputPlaceHolder:(NSIndexPath *)index;


- (NSString *)willSendMessageTitle;;

- (NSString *)willSendMessage;

@end

@interface AlarmPickerViewController : AlarmSettingViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    
#if kNeedNavigationBar
#else
    UIView      *_contentView;
    UILabel     *_contentTitle;
#endif
    UIPickerView *_picker;
}
#if kNeedNavigationBar
#else
- (CGFloat)contentHeight;
#endif

@end


