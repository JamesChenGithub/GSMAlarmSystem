//
//  TextFieldTableViewCell.h
//  iLunch
//
//  Created by James on 15-1-7.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextFieldTableViewCell;

typedef void (^TextFieldCellNextAction)(TextFieldTableViewCell *cell);

@interface TextFieldTableViewCell : UITableViewCell<UITextFieldDelegate>
{
    UITextField *_edit;
}

@property (nonatomic, readonly) UITextField *edit;
@property (nonatomic, weak) MenuItem *menu;
@property (nonatomic, copy) TextFieldCellNextAction nextAction;

- (instancetype)initWith:(NSString *)tip reuseIdentifier:(NSString *)reuseIdentifier;
- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder reuseIdentifier:(NSString *)reuseIdentifier;
- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder locateIcon:(UIImage *)icon reuseIdentifier:(NSString *)reuseIdentifier;
- (instancetype)initWith:(NSString *)tip placeHolder:(NSString *)holder locateIcon:(UIImage *)icon action:(CommonBlock)act reuseIdentifier:(NSString *)reuseIdentifier;

- (NSString *)editText;

@end

