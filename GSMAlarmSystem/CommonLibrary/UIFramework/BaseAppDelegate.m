//
//  BaseAppDelegate.m
//  iLunchCommon
//
//  Created by James on 3/6/14.
//  Copyright (c) 2014 iLunch. All rights reserved.
//

#import "BaseAppDelegate.h"
#import <objc/runtime.h>


@implementation BaseAppDelegate

+ (instancetype)sharedAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

- (void)redirectConsoleLog:(NSString *)logFile
{
    NSString *docPath = [PathUtility getDocumentPath];
    NSString *logfilePath = [NSString stringWithFormat:@"%@/%@", docPath, logFile];
    //    freopen([logfilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    freopen([logfilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
}

- (void)configAppearance
{
    [[UINavigationBar appearance] setBarTintColor:kThemeColor];
    [[UINavigationBar appearance] setTintColor:kWhiteColor];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = kWhiteColor;
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:kWhiteColor,
                                                           NSShadowAttributeName:shadow,
                                                           NSFontAttributeName:[UIFont fontWithName:@"Roboto-Regular" size:18]
                                                          }];
    
    

    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UILabel appearance] setBackgroundColor:kClearColor];
    [[UILabel appearance] setTextColor:kBlackColor];

    
    [[UIButton appearance] setTitleColor:kBlackColor forState:UIControlStateNormal];
    
//    [[UITableViewCell appearance] setBackgroundColor:kClearColor];
    
//    [[UITableViewCell appearance] setTintColor:kThemeColor];
    
//    Roboto-Regular.ttf
    
    [[UIButton appearance].titleLabel  setFont:[UIFont fontWithName:@"Roboto-Regular" size:12]];
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [[UITableViewCell appearance].textLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self configAppearance];
    
    // 日重重定向处理
    if ([self needRedirectConsole])
    {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        
        [self redirectConsoleLog:[NSString stringWithFormat:@"%@.log", currentDateStr]];
    }
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self enterMainUI];
    
    [self.window makeKeyAndVisible];
    
    [[NetworkUtility sharedNetworkUtility] startCheckWifi];
    return YES;
}

- (BOOL)needRedirectConsole
{
    return NO;
}


- (void)enterMainUI
{
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [SingletonMgr uninstall];
}

- (UINavigationController *)navigationViewController
{
    if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)self.window.rootViewController;
    }
    return nil;
}

- (UIViewController *)topViewController
{
    UINavigationController *nav = [self navigationViewController];
    return nav.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController
{
    @autoreleasepool
    {
        viewController.hidesBottomBarWhenPushed = YES;
        [[self navigationViewController] pushViewController:viewController animated:NO];
    }
}
- (UIViewController *)popViewController
{
    return [[self navigationViewController] popViewControllerAnimated:NO];
}
- (NSArray *)popToRootViewController
{
    return [[self navigationViewController] popToRootViewControllerAnimated:NO];
}

@end
