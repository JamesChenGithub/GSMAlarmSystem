//
//  TextFieldTableViewCell.m
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "TextFieldTableViewCell.h"

@implementation TextFieldTableViewCell

- (instancetype)initWith:(NSString *)tip reuseIdentifier:(NSString *)reuseIdentifier
{
    return [self initWith:tip placeHolder:nil reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        _edit = [[UITextField alloc] initLeftWith:tip];
        _edit.placeholder = holder;
        _edit.layer.cornerRadius = 3;
        _edit.backgroundColor = RGBOF(0xEFEFF0);
        _edit.font = kDefaultFont;
        _edit.delegate = self;
        [self.contentView addSubview:_edit];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder locateIcon:(UIImage *)icon reuseIdentifier:(NSString *)reuseIdentifier
{
    return [self initWith:tip placeHolder:holder locateIcon:icon action:nil reuseIdentifier:reuseIdentifier];
}
- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder locateIcon:(UIImage *)icon action:(CommonBlock)act reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])
    {
        _edit = [[UITextField alloc] initLeftWith:tip rightImageWith:icon action:act];
        _edit.placeholder = holder;
        _edit.layer.cornerRadius = 8;
        _edit.backgroundColor = RGBOF(0xEFEFF0);
        _edit.delegate = self;
        _edit.font = kDefaultFont;
        [self.contentView addSubview:_edit];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

- (void)relayoutFrameOfSubViews
{
    CGRect bounds = self.contentView.bounds;
    _edit.backgroundColor = [UIColor flatWhiteColor];
    _edit.frame = CGRectInset(bounds, kDefaultMargin, 3);
}

- (NSString *)editText
{
    return _edit.text;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    self.menu.title = textField.text;
    return YES;
}

@end

