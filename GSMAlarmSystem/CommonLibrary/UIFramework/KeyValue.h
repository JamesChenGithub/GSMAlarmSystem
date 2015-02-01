//
//  KeyValue.h
//  iLunch
//
//  Created by James on 14-7-22.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValue : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *value;

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value;

+ (instancetype)key:(NSString *)key value:(NSString *)value;

@end
