//
//  ButtonBar.h
//  HarmanCommon
//
//  Created by James on 3/11/14.
//  Copyright (c) 2014 Harman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonBar;

@protocol ButtonBarDelegate <NSObject>

- (void)onButtonBar:(ButtonBar *)panel navigateTo:(NSInteger)index;

@end

@interface ButtonBar : UIView
{
@protected
    UIButton *_selectButton;

}

@property (nonatomic, weak) id<ButtonBarDelegate> delegate;

- (instancetype)initWith:(NSArray *)menuItems;

- (void)select:(NSInteger)index;


@end
