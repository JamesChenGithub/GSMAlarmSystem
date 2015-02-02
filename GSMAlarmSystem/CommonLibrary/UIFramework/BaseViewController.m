//
//  BaseViewController.m
//  TCLSales
//
//  Created by 陈耀武 on 14-1-15.
//  Copyright (c) 2014年 iLunch. All rights reserved.
//

#import "BaseViewController.h"

#import <MessageUI/MessageUI.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

#if kNeedNavigationBar
#else
- (void)addTitleViews
{
    _navHead = [[UIView alloc] init];
    [self.view addSubview:_navHead];
    
    _cancelButton = [[UIButton alloc] init];
    [_cancelButton setTitle:kcancel forState:UIControlStateNormal];
    [_cancelButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    _cancelButton.backgroundColor = RGBOF(0x727272);
    [_cancelButton addTarget:self action:@selector(onClickCancel) forControlEvents:UIControlEventTouchUpInside];
    [_navHead addSubview:_cancelButton];
    _cancelButton.titleLabel.font = kDefaultFont;
    
    _navTitleLabel = [[UILabel alloc] init];
    _navTitleLabel.textColor =  RGBOF(0xC4C4C4);
//    _navTitleLabel.backgroundColor = RGBOF(0xC4C4C4);
    _navTitleLabel.textAlignment = NSTextAlignmentCenter;
    _navTitleLabel.text = kapp_name;
    _navTitleLabel.adjustsFontSizeToFitWidth = YES;
    [_navHead addSubview:_navTitleLabel];
    _navTitleLabel.font = kDefaultFontSize(20);
    
    _doneButton = [[UIButton alloc] init];
    [_doneButton setTitle:kok forState:UIControlStateNormal];
    [_doneButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    _doneButton.backgroundColor = RGBOF(0x727272);
    [_doneButton addTarget:self action:@selector(onClickDone) forControlEvents:UIControlEventTouchUpInside];
    [_navHead addSubview:_doneButton];
    _doneButton.titleLabel.font = kDefaultFont;
}

- (void)layoutNavHead
{
    [_navHead sizeWith:CGSizeMake(self.view.bounds.size.width, 44)];
    [_navHead alignParentTopWithMargin:20];
    
    [_cancelButton sizeWith:CGSizeMake(60, 30)];
    [_cancelButton layoutParentVerticalCenter];
    [_cancelButton alignParentLeftWithMargin:kDefaultMargin];
    _cancelButton.layer.cornerRadius = 5;
    
    [_doneButton sameWith:_cancelButton];
    [_doneButton alignParentRightWithMargin:kDefaultMargin];
    _doneButton.layer.cornerRadius = 5;
    
    [_navTitleLabel sameWith:_cancelButton];
    [_navTitleLabel layoutToRightOf:_cancelButton margin:kDefaultMargin];
    [_navTitleLabel scaleToLeftOf:_doneButton margin:kDefaultMargin];
}

- (void)onClickCancel
{
    
}
- (void)onClickDone
{
    
}
#endif

- (void)viewDidLoad
{
#if kNeedNavigationBar
#else
    self.navigationController.navigationBar.hidden = YES;
#endif
    [super viewDidLoad];
}

#if kNeedNavigationBar
#else
- (void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}
#endif


- (void)sendMessage:(NSString *)msg
{
    [self sendMessage:msg withCompletion:nil];
}

- (void)sendMessage:(NSString *)msg withCompletion:(void (^)(void))completion
{
    BOOL canSendSMS = [MFMessageComposeViewController canSendText];
    
    NSLog(@"can send SMS [%d]",canSendSMS);
    
    if (canSendSMS)
    {
        MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
        picker.messageComposeDelegate = self;
//        [picker.navigationBar setTintColor:self.navigationController.navigationBar.tintColor];
//        [picker.navigationBar setBarTintColor:self.navigationController.navigationBar.barTintColor];
        picker.body = msg;
        picker.subject = msg;
        
        NSString *num = [AppSetting sharedInstance].host.value;
        if (![NSString isEmpty:num])
        {
            picker.recipients = [NSArray arrayWithObject:num];
        }
        
        
//        __weak typeof(self) ws = self;
        
        [[AppDelegate sharedAppDelegate].topViewController presentViewController:picker animated:YES completion:completion];
    }
}


-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    
    
    //Notifies users about errors associated with the interface
    
    switch (result)
    {
        case MessageComposeResultCancelled:
            
            //            [HUDHelper sharedInstance] tipMessage:@""]
            
            DebugLog(@"Result: canceled");
            
            break;
            
        case MessageComposeResultSent:
            
            [[HUDHelper sharedInstance] tipMessage:kmsg_done];
            DebugLog(@"Result: Sent");
            
            break;
            
        case MessageComposeResultFailed:
            
            [[HUDHelper sharedInstance] tipMessage:kmsg_fail];
            DebugLog(@"Result: Failed");
            
            break;
            
        default:
            
            break;
            
    }
    __weak typeof(self) ws = self;
    [[AppDelegate sharedAppDelegate].topViewController dismissViewControllerAnimated:YES completion:^{
        [ws performSelector:@selector(layoutSubviewsFrame) withObject:nil afterDelay:0.3];
    }];
    
}




@end
