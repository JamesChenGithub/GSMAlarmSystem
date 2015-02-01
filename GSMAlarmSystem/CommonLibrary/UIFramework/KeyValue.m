
//
//  KeyValue.m
//  iLunch
//
//  Created by James on 14-7-22.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "KeyValue.h"

@implementation KeyValue

+ (instancetype)key:(NSString *)key value:(NSString *)value
{
    return [[KeyValue alloc] initWithKey:key value:value];
}

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value
{
    if (self = [super init])
    {
        self.key = key;
        self.value = value;
    }
    return self;
}
@end
