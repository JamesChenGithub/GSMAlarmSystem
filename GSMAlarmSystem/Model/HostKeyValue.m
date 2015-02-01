//
//  HostKeyValue.m
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "HostKeyValue.h"

@implementation HostKeyValue

- (NSMutableDictionary *)jsonDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.key forKey:@"key"];
    [dic setValue:self.value forKey:@"value"];
    return dic;
}

- (NSString *)description
{
    NSMutableDictionary *dic = [self jsonDictionary];
    
    if ([NSJSONSerialization isValidJSONObject:dic])
    {
        return [NSString stringWithFormat:@"%@", dic];
    }
    
    DebugLog(@" [ %@ convertToJSONString failde]", self.class);
    return [super description];
}

@end
