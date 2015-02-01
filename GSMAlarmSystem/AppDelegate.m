//
//  AppDelegate.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationViewController;

@end

@implementation AppDelegate

- (void)enterMainUI
{
    
    HostViewController *main = [[HostViewController alloc] init];
    self.navigationViewController = [[NavigationViewController alloc] initWithRootViewController:main];
    self.window.rootViewController = self.navigationViewController;
    

    
}

@end
