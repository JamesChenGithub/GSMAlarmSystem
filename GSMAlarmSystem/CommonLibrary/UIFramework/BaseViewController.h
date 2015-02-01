//
//  BaseViewController.h
//  TCLSales
//
//  Created by 陈耀武 on 14-1-15.
//  Copyright (c) 2014年 iLunch. All rights reserved.
//

#import "CommonBaseViewController.h"
//#import "ReqDelegate.h"
#import <MessageUI/MessageUI.h>

@interface BaseViewController : CommonBaseViewController<MFMessageComposeViewControllerDelegate>
#if kNeedNavigationBar
#else
{
@protected
    UIView   *_navHead;
    UIButton *_cancelButton;
    UILabel  *_navTitleLabel;
    UIButton *_doneButton;

    
}
- (void)addTitleViews;
- (void)layoutNavHead;
- (void)onClickCancel;
- (void)onClickDone;
#endif


- (void)sendMessage:(NSString *)msg;
- (void)sendMessage:(NSString *)msg withCompletion:(void (^)(void))completion;


@end
