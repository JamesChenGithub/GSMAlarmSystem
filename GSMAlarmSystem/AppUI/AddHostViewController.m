//
//  AddHostViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AddHostViewController.h"

@interface AddHostViewController ()

@property (nonatomic, copy) CommonBlock doneAction;
@end


@implementation AddHostViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_hostName resignFirstResponder];
    [_hostNum resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (instancetype)initWith:(CommonBlock)host
{
    if (self = [super init])
    {
        self.doneAction = host;
    }
    return self;
}
#if kNeedNavigationBar
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:kcancel style:UIBarButtonItemStylePlain target:self action:@selector(onCancel)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:kok style:UIBarButtonItemStylePlain target:self action:@selector(onDone)];
    self.navigationItem.rightBarButtonItem = done;
    
    self.title = kapp_name;
    
}

#endif

- (void)onCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onDone
{
    NSString *host = _hostName.text;
    NSString *num = _hostNum.text;
    
    if ([NSString isEmpty:host] || [NSString isEmpty:num])
    {
        return;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        HostKeyValue *hkv = [[HostKeyValue alloc] initWithKey:host value:num];
        [[AppSetting sharedInstance] addHost:hkv];
        if (self.doneAction)
        {
            self.doneAction(hkv);
        }
    }];
}

#if kNeedNavigationBar

- (void)addOwnViews
{
    _hostName = [[UITextField alloc] init];
    _hostName.placeholder = khost_name;
    [self.view addSubview:_hostName];
    
    _hostNum = [[UITextField alloc] init];
    _hostNum.placeholder = khost_number;
//    _hostNum.backgroundColor = RGB(245, 245, 245);
    _hostNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_hostNum];
}

- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    [_hostName sizeWith:CGSizeMake(size.width - 2 * kDefaultMargin, 44)];
    [_hostName layoutParentHorizontalCenter];
    
    [_hostNum sameWith:_hostName];
    [_hostNum layoutBelow:_hostName];
}

#else

- (void)onClickCancel
{
    [self onCancel];
}

- (void)onClickDone
{
    [self onDone];
}

- (void)addOwnViews
{
    [self addTitleViews];
    
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = kWhiteColor;
    [self.view addSubview:_contentView];
    
    
    _contentTitle = [[UILabel alloc] init];
    _contentTitle.textColor = [UIColor flatBlueColor];
    _contentTitle.backgroundColor = RGBOF(0xC4C4C4);
    _contentTitle.textAlignment = NSTextAlignmentCenter;
    _contentTitle.text = kadd_host;
    [_contentView addSubview:_contentTitle];
    
    _hostName = [[UITextField alloc] init];
    _hostName.placeholder = khost_name;
    _hostName.backgroundColor = RGBOF(0xEFEFF0);
    [_contentView addSubview:_hostName];
    
    _hostNum = [[UITextField alloc] init];
    _hostNum.placeholder = khost_number;
    _hostNum.backgroundColor = RGBOF(0xEFEFF0);
    _hostNum.keyboardType = UIKeyboardTypeNumberPad;
    [_contentView addSubview:_hostNum];
    
    _hostName.layer.cornerRadius = 5;
    _hostNum.layer.cornerRadius = 5;
}

- (void)layoutOnIPhone
{
    [self layoutNavHead];
    
    [_contentView sizeWith:CGSizeMake(self.view.bounds.size.width - 40, 200)];
    [_contentView layoutParentHorizontalCenter];
    [_contentView alignParentTopWithMargin:80];
    
    [_contentTitle sizeWith:CGSizeMake(_contentView.bounds.size.width, 30)];
    
    CGSize size = _contentView.bounds.size;
    [_hostName sizeWith:CGSizeMake(size.width - 30, 44)];
    [_hostName layoutParentHorizontalCenter];
    [_hostName layoutBelow:_contentTitle margin:20];
    
    [_hostNum sameWith:_hostName];
    [_hostNum layoutBelow:_hostName margin:20];
}

#endif

@end
