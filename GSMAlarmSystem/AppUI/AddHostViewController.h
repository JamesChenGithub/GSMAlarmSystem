//
//  AddHostViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface AddHostViewController : BaseViewController
{
#if kNeedNavigationBar
#else
    UIView      *_contentView;
    UILabel     *_contentTitle;
    
#endif
    UITextField *_hostName;
    UITextField *_hostNum;
}

- (instancetype)initWith:(CommonBlock)host;

@end
