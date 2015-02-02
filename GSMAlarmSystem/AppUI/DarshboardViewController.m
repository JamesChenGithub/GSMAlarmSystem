//
//  DarshboardViewController.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "DarshboardViewController.h"

@interface DarshboardViewController ()

@property (nonatomic, strong) NSArray *menus;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation DarshboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = kapp_name;
}


- (void)addOwnViews
{
    MainViewController *main = [[MainViewController alloc] init];
//    main.view.backgroundColor = kRedColor;
    
    SettingViewController *setting = [[SettingViewController alloc] init];
//    setting.view.backgroundColor = kBlueColor;
    
    MoreViewController *more = [[MoreViewController alloc] init];
//    more.view.backgroundColor = kYellowColor;
    
    _scrollView = [[LibraryScrollView alloc] init];
    _scrollView.delegate = self;
    self.controllers = @[main, setting, more];
    [self.view addSubview:_scrollView];
    
//    __weak typeof(_scrollView) wsc = _scrollView;
    MenuItem *mainItem = [[MenuItem alloc] initWithTitle:ktab_menu icon:nil action:nil];
    MenuItem *settingItem = [[MenuItem alloc] initWithTitle:ktab_settings icon:nil action:nil];
    MenuItem *moreItem = [[MenuItem alloc] initWithTitle:ktab_more icon:nil action:nil];
    
    self.menus = @[mainItem, settingItem, moreItem];
    
#if kNeedNavigationBar
#else
    _backButton = [[UIButton alloc] init];
    [_backButton setImage:[[UIImage imageNamed:@"back"] imageWithTintColor:kWhiteColor] forState:UIControlStateNormal];
    [_backButton setBackgroundImage:[UIImage imageWithColor:RGBOF(0xB2B1AE)] forState:UIControlStateNormal];
    [_backButton setBackgroundImage:[UIImage imageWithColor:RGBOF(0x92D1DE)] forState:UIControlStateSelected];
    [_backButton addTarget:self action:@selector(onGoBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
#endif
    
    _bottomBar = [[ButtonBar alloc] initWith:self.menus];
    _bottomBar.delegate = self;
    [self.view addSubview:_bottomBar];
}

- (void)onGoBack
{
    [[AppDelegate sharedAppDelegate] popViewController];
}
#if kNeedNavigationBar
- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;
    [_bottomBar sizeWith:CGSizeMake(size.width, kBottomButtonHeight)];
    [_bottomBar alignParentBottom];
    [_bottomBar relayoutFrameOfSubViews];
    
    CGRect libPageRect = self.view.bounds;
    libPageRect.size.height -= kBottomButtonHeight;
    
    if (_scrollView.pages.count == 0)
    {
        [_scrollView setFrameAndLayout:libPageRect withPages:self.controllers];
    }
    else
    {
        [_scrollView setFrameAndLayout:libPageRect];
    }
}

#else
- (void)layoutOnIPhone
{
    CGSize size = self.view.bounds.size;

    [_backButton sizeWith:CGSizeMake(kBottomButtonHeight, kBottomButtonHeight)];
    [_backButton alignParentBottom];
    
    [_bottomBar sizeWith:CGSizeMake(size.width - kBottomButtonHeight, kBottomButtonHeight)];
    [_bottomBar layoutToRightOf:_backButton];
    [_bottomBar alignParentBottom];
    [_bottomBar relayoutFrameOfSubViews];
    
    CGRect libPageRect = self.view.bounds;
    libPageRect.origin.y += 20;
    libPageRect.size.height -= kBottomButtonHeight + 20;
    
    if (_scrollView.pages.count == 0)
    {
        [_scrollView setFrameAndLayout:libPageRect withPages:self.controllers];
    }
    else
    {
        [_scrollView setFrameAndLayout:libPageRect];
    }
}

#endif

- (void)onPageScrollView:(PageScrollView *)pageView scrollToPage:(NSInteger)pageIndex
{
    [_bottomBar select:pageIndex];
}


- (void)onButtonBar:(ButtonBar *)panel navigateTo:(NSInteger)index
{
    [_scrollView scrollTo:index];
}


@end
