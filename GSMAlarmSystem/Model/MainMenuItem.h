//
//  MainMenuItem.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "MenuItem.h"

@interface MainMenuItem : MenuItem

@property (nonatomic, copy) NSString *message;

- (instancetype)initWithMsg:(NSString *)msg icon:(UIImage *)icon action:(MenuAction)action;

@end
