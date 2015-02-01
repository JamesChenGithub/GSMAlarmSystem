//
//  AppSetting.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSetting : NSObject

@property (nonatomic, strong) HostKeyValue *host;

+ (instancetype)sharedInstance;

- (NSMutableArray *)loadMainHost;

- (void)addHost:(HostKeyValue *)host;
- (void)removeHost:(HostKeyValue *)host;


@end
