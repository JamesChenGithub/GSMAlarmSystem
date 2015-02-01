//
//  AppSetting.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AppSetting.h"

@interface AppSetting ()

@property (nonatomic, strong) NSMutableArray *mainHost;

@end

@implementation AppSetting

static AppSetting *_shareInstance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _shareInstance = [[AppSetting alloc] init];
    });
    
    return _shareInstance;
}

#define kMainHostPreferenceList @"MainHostPreference.plist"

- (NSMutableArray *)mainHost
{
    if (!_mainHost)
    {
        _mainHost = [NSMutableArray array];
    }
    return _mainHost;
}

- (NSMutableArray *)loadMainHost
{
    NSString *path = [PathUtility getFileDocumentPath:kMainHostPreferenceList];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSArray *hosts = [jsonData objectFromJSONData];
    _mainHost = [NSObject loadItem:[HostKeyValue class] fromDictionary:hosts];
    return _mainHost;
}

- (void)addHost:(HostKeyValue *)host
{
    [self.mainHost addObject:host];
    [self saveHost];
}

- (void)saveHost
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSMutableArray *hosts = [NSMutableArray array];
        for (HostKeyValue *item in self.mainHost)
        {
            NSDictionary *dic = [item jsonDictionary];
            if (dic)
            {
                [hosts addObject:dic];
            }
        }
    
        
        if ([NSJSONSerialization isValidJSONObject:hosts])
        {
            NSError *error = nil;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:hosts options:NSJSONWritingPrettyPrinted error: &error];
            NSString *path = [PathUtility getFileDocumentPath:kMainHostPreferenceList];
            BOOL succ = [jsonData writeToFile:path atomically:YES];
            DebugLog(@"保存成功 succ = %i", succ);
        }
        else
        {
            DebugLog(@"保存出错");
        }
    });
}

- (void)removeHost:(HostKeyValue *)host
{
    [self.mainHost removeObject:host];
    [self saveHost];
}


@end
