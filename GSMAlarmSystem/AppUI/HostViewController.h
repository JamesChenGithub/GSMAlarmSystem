//
//  HostViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "KeyValueTableViewController.h"

@interface HostViewController : KeyValueTableViewController
{
@protected
    
#if kNeedNavigationBar
#else
    
    UIButton    *_editButton;
    UIView      *_contentView;
    UILabel     *_contentTitle;
    
#endif
    
    UIButton    *_addHost;
}

@end
