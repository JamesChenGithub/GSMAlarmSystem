//
//  ButtonBar.m
//  HarmanCommon
//
//  Created by James on 3/11/14.
//  Copyright (c) 2014 Harman. All rights reserved.
//

#import "ButtonBar.h"

@interface ButtonBar()

@property (nonatomic, strong) NSMutableArray *menuButtons;

@end

@implementation ButtonBar

- (void)createButton:(MenuItem *)item
{
    MenuButton *button = [[MenuButton alloc] init];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleLabel.numberOfLines = 0;
    [button setTitle:[item title] forState:UIControlStateNormal];
    [button setTitleColor:kWhiteColor forState:UIControlStateNormal];
    button.titleLabel.font = kDefaultFont;
    
    __weak typeof(self) ws = self;
    __weak UIButton *current = button;
    [button setClickAction:^(id<MenuAbleItem> menu) {
        [ws onClick:current];
        [item menuAction];
    }];
    [self addSubview:button];
    
    [self.menuButtons addObject:button];
}

- (instancetype)initWith:(NSArray *)menuItems
{
    if (self = [super initWithFrame:CGRectZero])
    {
        self.menuButtons = [NSMutableArray array];
        
        for (MenuItem *item in menuItems)
        {
            [self createButton:item];
        }
        
        [self select:0];
        
        self.backgroundColor = RGBOF(0xB2B1AE);
    }
    return self;
}

- (void)onClick:(UIButton *)button
{
    if (_selectButton != button)
    {
        _selectButton.selected = NO;
        _selectButton.backgroundColor = kClearColor;
        
        _selectButton = button;
        if ([_delegate respondsToSelector:@selector(onButtonBar:navigateTo:)])
        {
            [_delegate onButtonBar:self navigateTo:[self.menuButtons indexOfObject:button]];
        }
        
        _selectButton.selected = YES;
        _selectButton.backgroundColor = RGBOF(0x92D2DF);
    }
    
}

#define kButtonSizeWidth 56
#define kButtonSizeHeight 30
#define kButtonMargin 10
- (void)relayoutFrameOfSubViews
{
    [self alignViews:self.subviews isSubView:YES padding:0 margin:0 horizontal:YES inRect:self.bounds];
}

- (void)select:(NSInteger)index
{
    if (index >=0 && index < self.menuButtons.count)
    {
        _selectButton.selected = NO;
        _selectButton.backgroundColor = kClearColor;
        
        UIButton *btn = [self.menuButtons objectAtIndex:index];
        _selectButton = btn;
        
        _selectButton.selected = YES;
        _selectButton.backgroundColor = RGBOF(0x92D2DF);
    }
}

@end
